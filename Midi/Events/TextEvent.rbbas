#tag Class
Protected Class TextEvent
Inherits Midi.Events.MidiEvent
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, EventID As Int32)
		  Super.Constructor(MidiFile)
		  Dim err As ErrorCodes = HP_ReadText(MidiFile.Handle, EventID, mTime, mText)
		  If err <> ErrorCodes.None Then Raise New MidiException(err)
		  mType = EventType.TEXT
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Destructor()
		  If mText <> Nil Then HP_Delete(mText)
		  mText = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Text() As String
		  Dim mb As MemoryBlock = mText
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Text(Assigns NewText As String)
		  Dim mb As MemoryBlock = NewText + Chr(0)
		  Dim err As ErrorCodes = HP_ChangeText(mMidiFile.Handle, mEventID, mb)
		  If err <> ErrorCodes.None Then Raise New MidiException(err)
		  Me.Destructor()
		  Me.Constructor(mMidiFile, mEventID)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mText As Ptr
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