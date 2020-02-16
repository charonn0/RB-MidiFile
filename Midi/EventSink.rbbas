#tag Class
Protected Class EventSink
Inherits MidiFile
	#tag Method, Flags = &h0
		Sub InsertEvent(ATEvent As Midi.Events.AfterTouchEvent)
		  mLastError = HP_InsertAftertouch(Me.Handle, ATEvent.Time, ATEvent.Channel, ATEvent.Note, ATEvent.Pressure)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertEvent(Note As Midi.Events.NoteEvent)
		  mLastError = HP_InsertNote(Me.Handle, Note.Time, Note.Length, Note.Note, Note.Channel, Note.Velocity)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertRawEvent(Time As Int32, RawEvent As MemoryBlock)
		  mLastError = HP_InsertRawEvent(Me.Handle, Time, RawEvent, RawEvent.Size)
		End Sub
	#tag EndMethod


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
