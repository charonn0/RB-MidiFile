#tag Class
Protected Class MidiFile
	#tag Method, Flags = &h0
		Sub Constructor()
		  If Not Midi.IsAvailable Then Raise New PlatformNotSupportedException
		  mMidi = HP_Init()
		  If mMidi = Nil Then Raise New MidiException(ErrorCodes.BINDING_ERROR)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Copy()
		  mLastError = HP_Copy(mMidi)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeselectChannel(Channel As Int32)
		  mLastError = HP_DeselectChan(mMidi, Channel)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeselectEvent(EventID As Int32)
		  mLastError = HP_Deselect(mMidi, EventID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mMidi <> Nil Then mLastError = HP_Free(mMidi)
		  mMidi = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTaktBeatTick(Time As Int32, ByRef Takt As Int32, ByRef Beat As Int32, ByRef Tick As Int32) As Boolean
		  mLastError = HP_GetTaktBeatTick(mMidi, Time, Takt, Beat, Tick)
		  Return mLastError = ErrorCodes.None
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTaktBeatTick(Time As Int32, TimeOfLastTimeSignature As Int32, TaktOfLastTimeSignature As Int32, Num As Int32, Denum As Int32, ByRef Takt As Int32, ByRef Beat As Int32, ByRef Tick As Int32) As Boolean
		  mLastError = HP_GetTaktBeatTick(mMidi, Time, TimeOfLastTimeSignature, TaktOfLastTimeSignature, Num, Denum, Takt, Beat, Tick)
		  Return mLastError = ErrorCodes.None
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeFromTaktBeatTick(Takt As Int32, Beat As Int32, Tick As Int32) As Int32
		  Dim time As Int32
		  mLastError = HP_GetTimeFromTaktBeatTick(mMidi, Takt, Beat, Tick, time)
		  Return time
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(MidiFile As FolderItem)
		  mLastError = HP_Load(mMidi, MidiFile.AbsolutePath_)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paste(Time As Int32, DeleteInDestination As Boolean, DeleteMode As Int32 = HP_ALL_EVENTS)
		  mLastError = HP_Paste(mMidi, Time, DeleteInDestination, DeleteMode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  Const HP_WAIT_PLAY = 2
		  mLastError = HP_SetPlayStopWait(Me.Handle, HP_WAIT_PLAY)
		  If mLastError = ErrorCodes.None Then mPaused = True Else Break
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play(SelectedOnly As Boolean = False, SendBefore As Boolean = False)
		  Dim selection As Integer = 1
		  If SelectedOnly Then selection = 2
		  mLastError = HP_Play(Me.Handle, selection, SendBefore)
		  If mLastError = ErrorCodes.None Then mPaused = False Else Break
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resume()
		  If mPaused Then
		    Const HP_GO_PLAY = 0
		    mLastError = HP_SetPlayStopWait(Me.Handle, HP_GO_PLAY)
		  Else
		    Me.Play()
		  End If
		  If mLastError = ErrorCodes.None Then mPaused = False Else Break
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(MidiFile As FolderItem, Format As Int32 = HP_SMF0)
		  mLastError = HP_Save(mMidi, MidiFile.AbsolutePath_, Format)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectEvent(EventID As Int32)
		  mLastError = HP_Select(mMidi, EventID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectEvents(Channel As Int32, StartTime As Int32, EndTime As Int32)
		  mLastError = HP_SelectChanTime(mMidi, Channel, StartTime, EndTime)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  Const HP_STOP_PLAY = 1
		  mLastError = HP_SetPlayStopWait(Me.Handle, HP_STOP_PLAY)
		  If mLastError = ErrorCodes.None Then mPaused = False Else Break
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Const HP_ALL = 1
			  If mMidi <> Nil Then Return HP_Duration(mMidi, HP_ALL)
			End Get
		#tag EndGetter
		Duration As Int32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Me.Handle <> Nil And IsPlaying Then Return HP_PlayEventTime(Me.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Me.Handle <> Nil Then mLastError = HP_SetPlayTime(Me.Handle, value)
			End Set
		#tag EndSetter
		EventTime As Int32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mMidi
			End Get
		#tag EndGetter
		Handle As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Me.Handle <> Nil Then Return HP_IsPlaying(Me.Handle)
			End Get
		#tag EndGetter
		IsPlaying As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLastError
			End Get
		#tag EndGetter
		LastError As Midi.ErrorCodes
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mLastError As Midi.ErrorCodes
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMidi As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPaused As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTempo As Int32 = 100
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Me.Handle <> Nil And IsPlaying Then Return HP_PlayTime(Me.Handle)
			End Get
		#tag EndGetter
		PlayTime As Int32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMidi <> Nil Then
			    Dim value As Int32
			    mLastError = HP_ReadPPQN(mMidi, value)
			    If mLastError = ErrorCodes.None Then Return value
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMidi <> Nil Then mLastError = HP_ChangePPQN(mMidi, value)
			  
			End Set
		#tag EndSetter
		PPQN As Int32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTempo
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Me.Handle = Nil Or Not IsPlaying Then Return
			  mLastError = HP_PlayTempo(Me.Handle, value)
			  If mLastError = ErrorCodes.None Then mTempo = value
			End Set
		#tag EndSetter
		Tempo As Int32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim ticks As Int32
			  If mMidi <> Nil Then mLastError = HP_GetLastTime(mMidi, ticks)
			  Return ticks
			End Get
		#tag EndGetter
		TickCount As Int32
	#tag EndComputedProperty


	#tag Constant, Name = HP_ALL_EVENTS, Type = Double, Dynamic = False, Default = \"-2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HP_NO_CHAN, Type = Double, Dynamic = False, Default = \"-1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HP_NO_TIME_LIMIT, Type = Double, Dynamic = False, Default = \"-1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HP_SMF0, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HP_SMF1, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsPlaying"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
