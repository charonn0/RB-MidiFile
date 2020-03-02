#tag Class
Protected Class ProgramChangeEvent
Inherits Midi.Events.MidiEvent
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, EventID As Int32)
		  Super.Constructor(MidiFile)
		  mLastError = HP_ReadProgramChange(MidiFile.Handle, EventID, mTime, mChannel, mVoice)
		  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
		  mType = EventType.PROGRAM_CHANGE
		  mEventID = EventID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Destination As Midi.MidiFile)
		  mLastError = HP_InsertProgramChange(Destination.Handle, mTime, mChannel, mVoice)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mVoice As Int32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mVoice
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMidiFile <> Nil Then
			    mLastError = HP_ChangeProgram(mMidiFile.Handle, mEventID, value)
			    If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  End If
			  mVoice = value
			End Set
		#tag EndSetter
		Voice As Int32
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
