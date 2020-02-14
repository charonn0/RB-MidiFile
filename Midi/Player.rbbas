#tag Class
Protected Class Player
Inherits MidiFile
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As FolderItem)
		  Super.Constructor()
		  Me.Load(MidiFile)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  Const HP_WAIT_PLAY = 2
		  mLastError = HP_SetPlayStopWait(Me.Handle, HP_WAIT_PLAY)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play(SelectedOnly As Boolean = False, SendBefore As Boolean = False)
		  Dim selection As Integer = 1
		  If SelectedOnly Then selection = 2
		  mLastError = HP_Play(Me.Handle, selection, SendBefore)
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
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  Const HP_STOP_PLAY = 1
		  mLastError = HP_SetPlayStopWait(Me.Handle, HP_STOP_PLAY)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Me.Handle <> Nil Then Return HP_IsPlaying(Me.Handle)
			End Get
		#tag EndGetter
		IsPlaying As Boolean
	#tag EndComputedProperty

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
		#tag Setter
			Set
			  If Me.Handle <> Nil Then mLastError = HP_SetPlayTime(Me.Handle, value)
			End Set
		#tag EndSetter
		PlayTime As Int32
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
