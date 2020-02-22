#tag Class
Protected Class SmpteOffsetEvent
Inherits Midi.Events.MidiEvent
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, EventID As Int32)
		  Super.Constructor(MidiFile)
		  mLastError = HP_ReadSmpteOffset(MidiFile.Handle, EventID, mTime, mHour, mMinute, mSecond, mFrames, mSubframes)
		  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
		  mType = EventType.SMPTE_OFFSET
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Destination As Midi.MidiFile)
		  mLastError = HP_InsertSmpteOffset(Destination.Handle, mHour, mMinute, mSecond, mFrames, mSubframes)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mFrames
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMidiFile <> Nil Then
			    mLastError = HP_ChangeSmpteOffset(mMidiFile.Handle, mEventID, mHour, mMinute, mSecond, value, mSubframes)
			    If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  End If
			  mFrames = value
			End Set
		#tag EndSetter
		Frames As Int32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mHour
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMidiFile <> Nil Then
			    mLastError = HP_ChangeSmpteOffset(mMidiFile.Handle, mEventID, value, mMinute, mSecond, mFrames, mSubframes)
			    If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  End If
			  mHour = value
			End Set
		#tag EndSetter
		Hour As Int32
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mFrames As Int32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHour As Int32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMinute
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMidiFile <> Nil Then
			    mLastError = HP_ChangeSmpteOffset(mMidiFile.Handle, mEventID, mHour, value, mSecond, mFrames, mSubframes)
			    If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  End If
			  mMinute = value
			End Set
		#tag EndSetter
		Minute As Int32
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mMinute As Int32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSecond As Int32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSubframes As Int32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSecond
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMidiFile <> Nil Then
			    mLastError = HP_ChangeSmpteOffset(mMidiFile.Handle, mEventID, mHour, mMinute, value, mFrames, mSubframes)
			    If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  End If
			  mSecond = value
			End Set
		#tag EndSetter
		Second As Int32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mSubframes
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMidiFile <> Nil Then
			    mLastError = HP_ChangeSmpteOffset(mMidiFile.Handle, mEventID, mHour, mMinute, mSecond, mFrames, value)
			    If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			  End If
			  mSubframes = value
			End Set
		#tag EndSetter
		Subframes As Int32
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
