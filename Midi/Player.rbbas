#tag Class
Protected Class Player
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As FolderItem)
		  If Not Midi.IsAvailable Then Raise New MidiException
		  mMidi = HP_Init()
		  If mMidi = Nil Then Raise New MidiException
		  mLastError = HP_Load(mMidi, MidiFile.AbsolutePath)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mMidi <> Nil Then mLastError = HP_Free(mMidi)
		  mMidi = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  Const HP_WAIT_PLAY = 2
		  mLastError = HP_SetPlayStopWait(mMidi, HP_WAIT_PLAY)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play(SelectedOnly As Boolean = False, SendBefore As Boolean = False)
		  Dim selection As Integer = 1
		  If SelectedOnly Then selection = 2
		  mLastError = HP_Play(mMidi, selection, SendBefore)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resume()
		  If mPaused Then
		    Const HP_GO_PLAY = 0
		    mLastError = HP_SetPlayStopWait(mMidi, HP_GO_PLAY)
		  Else
		    Me.Play()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  Const HP_STOP_PLAY = 1
		  mLastError = HP_SetPlayStopWait(mMidi, HP_STOP_PLAY)
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
			  If mMidi <> Nil Then Return HP_IsPlaying(mMidi)
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMidi <> Nil And IsPlaying Then Return HP_PlayTime(mMidi)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMidi <> Nil Then mLastError = HP_SetPlayTime(mMidi, value)
			End Set
		#tag EndSetter
		PlayTime As Int32
	#tag EndComputedProperty


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
