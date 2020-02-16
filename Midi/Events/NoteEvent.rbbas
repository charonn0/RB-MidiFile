#tag Class
Protected Class NoteEvent
Inherits Midi.Events.MidiEvent
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, EventID As Int32)
		  Dim err As ErrorCodes = HP_ReadNote(MidiFile.Handle, EventID, mTime, mChannel, mNote, mVelocity, mLength)
		  If err <> ErrorCodes.None Then Raise New MidiException(err)
		  mType = EventType.Note
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLength
			End Get
		#tag EndGetter
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
		Note As Int32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mVelocity
			End Get
		#tag EndGetter
		Velocity As Int32
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
