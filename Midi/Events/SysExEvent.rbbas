#tag Class
Protected Class SysExEvent
Inherits Midi.Events.MidiEvent
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, EventID As Int32)
		  Super.Constructor(MidiFile)
		  mLastError = HP_ReadSysEx(MidiFile.Handle, EventID, mTime, mData, mLength)
		  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
		  mType = EventType.SYSEX
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mData
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLastError = HP_ChangeSysEx(mMidiFile.Handle, mEventID, value)
			  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  mLength = value.Size
			End Set
		#tag EndSetter
		Data As MemoryBlock
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLength
			End Get
		#tag EndGetter
		Length As Int32
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mData As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLength As Int32
	#tag EndProperty


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
