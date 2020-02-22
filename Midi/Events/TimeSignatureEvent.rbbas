#tag Class
Protected Class TimeSignatureEvent
Inherits Midi.Events.MidiEvent
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, EventID As Int32)
		  Super.Constructor(MidiFile)
		  mLastError = HP_ReadTimeSignature(MidiFile.Handle, EventID, mTime, mNum, mDenum, mMetronome, mN32)
		  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
		  mType = EventType.TIME_SIGNATURE
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Destination As Midi.MidiFile)
		  mLastError = HP_InsertTimeSignature(Destination.Handle, mTime, mNum, mDenum, mMetronome, mN32)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDenum
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLastError = HP_ChangeTimeSignature(mMidiFile.Handle, mEventID, mNum, value, mMetronome, mN32)
			  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  mDenum = value
			End Set
		#tag EndSetter
		Denum As Int32
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mDenum As Int32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMetronome
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLastError = HP_ChangeTimeSignature(mMidiFile.Handle, mEventID, mNum, mDenum, value, mN32)
			  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  mMetronome = value
			End Set
		#tag EndSetter
		Metronome As Int32
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mMetronome As Int32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mN32 As Int32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNum As Int32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mN32
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLastError = HP_ChangeTimeSignature(mMidiFile.Handle, mEventID, mNum, mDenum, mMetronome, value)
			  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  mN32 = value
			End Set
		#tag EndSetter
		N32 As Int32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mNum
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLastError = HP_ChangeTimeSignature(mMidiFile.Handle, mEventID, value, mDenum, mMetronome, mN32)
			  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  mNum = value
			End Set
		#tag EndSetter
		Num As Int32
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
