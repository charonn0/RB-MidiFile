#tag Class
Protected Class ChordEvent
Inherits Midi.Events.MidiEvent
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, EventID As Int32)
		  Super.Constructor(MidiFile)
		  mLastError = HP_ReadChord(MidiFile.Handle, EventID, mTime, mChordRoot, mChordType, mBassNote, mBassChord, mData)
		  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
		  mType = EventType.CHORD_NAME
		  mEventID = EventID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Destination As Midi.MidiFile)
		  mLastError = HP_InsertChord(Destination.Handle, mTime, mChordRoot, mChordType, mBassNote, mBassChord)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBassChord
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMidiFile <> Nil Then
			    mLastError = HP_ChangeChord(mMidiFile.Handle, mEventID, mChordRoot, mChordType, mBassNote, value)
			    If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  End If
			  mBassChord = value
			End Set
		#tag EndSetter
		BassChord As UInt8
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBassNote
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMidiFile <> Nil Then
			    mLastError = HP_ChangeChord(mMidiFile.Handle, mEventID, mChordRoot, mChordType, value, mBassChord)
			    If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  End If
			  mBassNote = value
			End Set
		#tag EndSetter
		BassNote As UInt8
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mChordRoot
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMidiFile <> Nil Then
			    mLastError = HP_ChangeChord(mMidiFile.Handle, mEventID, value, mChordType, mBassNote, mBassChord)
			    If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  End If
			  mChordRoot = value
			End Set
		#tag EndSetter
		ChordRoot As UInt8
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mChordType
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMidiFile <> Nil Then
			    mLastError = HP_ChangeChord(mMidiFile.Handle, mEventID, mChordRoot, value, mBassNote, mBassChord)
			    If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  End If
			  mChordType = value
			End Set
		#tag EndSetter
		ChordType As UInt8
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBassChord As UInt8
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBassNote As UInt8
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChordRoot As UInt8
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChordType As UInt8
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
