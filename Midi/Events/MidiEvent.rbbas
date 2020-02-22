#tag Class
Protected Class MidiEvent
	#tag Method, Flags = &h0
		Sub Constructor(ID As Int32, Channel As Int32, Time As Int32, Type As Midi.EventType)
		  mEventID = ID
		  mChannel = Channel
		  mTime = Time
		  mType = Type
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(MidiFile As Midi.MidiFile)
		  mMidiFile = MidiFile
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, ID As Int32)
		  mEventID = ID
		  mMidiFile = MidiFile
		  mLastError = HP_ReadEventData(mMidiFile.Handle, ID, mTime, mData, mLength)
		  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Destination As Midi.MidiFile)
		  mLastError = HP_InsertRawEvent(Destination.Handle, mTime, mData, mLength)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Time() As Int32
		  return mTime
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Time(Assigns NewTime As Int32)
		  mLastError = HP_ShiftEvent(mMidiFile.Handle, mEventID, NewTime)
		  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mChannel
			End Get
		#tag EndGetter
		Channel As Int32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mEventID
			End Get
		#tag EndGetter
		EventID As Int32
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mChannel As Int32 = HP_NO_CHAN
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mData As Ptr
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mEventID As Int32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLastError As Midi.ErrorCodes
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLength As Int32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mMidiFile As MidiFile
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mNote As Int32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mTime As Int32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mType As Midi.EventType
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mValue As Int32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mType
			End Get
		#tag EndGetter
		Type As Midi.EventType
	#tag EndComputedProperty


	#tag Constant, Name = HP_NO_CHAN, Type = Double, Dynamic = False, Default = \"-1", Scope = Public
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
