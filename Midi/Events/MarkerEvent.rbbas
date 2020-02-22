#tag Class
Protected Class MarkerEvent
Inherits Midi.Events.TextEvent
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, EventID As Int32)
		  Super.Constructor(MidiFile)
		  mLastError = HP_ReadMarker(MidiFile.Handle, EventID, mTime, mText)
		  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
		  mType = EventType.MARKER
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Destination As Midi.MidiFile)
		  mLastError = HP_InsertMarker(Destination.Handle, mTime, mText)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Text(Assigns NewText As String)
		  Dim mb As MemoryBlock = NewText + Chr(0)
		  mLastError = HP_ChangeMarker(mMidiFile.Handle, mEventID, mb)
		  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
		  Me.Destructor()
		  Me.Constructor(mMidiFile, mEventID)
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
