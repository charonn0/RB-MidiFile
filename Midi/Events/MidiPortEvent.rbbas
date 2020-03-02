#tag Class
Protected Class MidiPortEvent
Inherits Midi.Events.MidiEvent
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, EventID As Int32)
		  Super.Constructor(MidiFile)
		  mLastError = HP_ReadMIDIPort(MidiFile.Handle, EventID, mTime, mTrack, mPort)
		  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
		  mType = EventType.MIDI_PORT
		  mEventID = EventID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Destination As Midi.MidiFile)
		  mLastError = HP_InsertMIDIPort(Destination.Handle, mTime, mTrack, mPort)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mPort As Int32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTrack As Int32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPort
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMidiFile <> Nil Then
			    mLastError = HP_ChangeMIDIPort(mMidiFile.Handle, mEventID, mTrack, value)
			    If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  End If
			  mPort = value
			End Set
		#tag EndSetter
		Port As Int32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTrack
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMidiFile <> Nil Then
			    mLastError = HP_ChangeMIDIPort(mMidiFile.Handle, mEventID, value, mPort)
			    If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  End If
			  mTrack = value
			End Set
		#tag EndSetter
		Track As Int32
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
