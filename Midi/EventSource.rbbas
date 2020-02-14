#tag Class
Protected Class EventSource
Inherits MidiFile
	#tag Method, Flags = &h0
		Function GetNextEvent() As Boolean
		  Dim id, chan, time As Int32
		  Dim type As UInt32
		  
		  mLastError = HP_ReadEvent(Me.Handle, id, chan, time, type)
		  If mLastError = ErrorCodes.None Then
		    mCurrentEvent.ID = id
		    mCurrentEvent.Channel = chan
		    mCurrentEvent.Time = time
		    mCurrentEvent.Type = type
		    Return True
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(MidiFile As FolderItem)
		  Super.Load(MidiFile)
		  mReadable = True
		  Call GetNextEvent()
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCurrentEvent
			End Get
		#tag EndGetter
		CurrentEvent As Midi.MidiEvent
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCurrentEvent As Midi.MidiEvent
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReadable As Boolean
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
