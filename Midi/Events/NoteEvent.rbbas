#tag Class
Protected Class NoteEvent
Inherits Midi.Events.MidiEvent
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, EventID As Int32)
		  Super.Constructor(MidiFile)
		  mLastError = HP_ReadNote(MidiFile.Handle, EventID, mTime, mChannel, mNote, mVelocity, mLength)
		  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
		  mType = EventType.NOTE
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Destination As Midi.MidiFile)
		  mLastError = HP_InsertNote(Destination.Handle, mTime, mLength, mNote, mChannel, mVelocity)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLength
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLastError = HP_ChangeNoteLength(mMidiFile.Handle, mEventID, mChannel, mNote, value, HP_ABSOLUTE)
			  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			End Set
		#tag EndSetter
		Length As Int32
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mLength As Int32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNote As Int32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVelocity As Int32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mNote
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLastError = HP_ChangeNote(mMidiFile.Handle, mEventID, mChannel, value, HP_ABSOLUTE)
			  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			End Set
		#tag EndSetter
		Note As Int32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mVelocity
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLastError = HP_ChangeVelocity(mMidiFile.Handle, mEventID, mChannel, mNote, value, HP_ABSOLUTE)
			  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			End Set
		#tag EndSetter
		Velocity As Int32
	#tag EndComputedProperty


	#tag Constant, Name = HP_ABSOLUTE, Type = Boolean, Dynamic = False, Default = \"True", Scope = Private
	#tag EndConstant

	#tag Constant, Name = HP_RELATIVE, Type = Boolean, Dynamic = False, Default = \"False", Scope = Private
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
