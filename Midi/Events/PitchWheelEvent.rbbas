#tag Class
Protected Class PitchWheelEvent
Inherits Midi.Events.MidiEvent
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, EventID As Int32)
		  Super.Constructor(MidiFile)
		  mLastError = HP_ReadPitchWheel(MidiFile.Handle, EventID, mTime, mChannel, mValue)
		  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
		  mType = EventType.PITCH_WHEEL
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mValue As Int32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mValue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLastError = HP_ChangePitchWheel(mMidiFile.Handle, mEventID, value)
			  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			End Set
		#tag EndSetter
		Value As Int32
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
