#tag Class
Protected Class ChannelPressureEvent
Inherits Midi.Events.MidiEvent
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, EventID As Int32)
		  Super.Constructor(MidiFile)
		  mLastError = HP_ReadChannelPressure(MidiFile.Handle, EventID, mTime, mChannel, mPressure)
		  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
		  mType = EventType.CHANNEL_PRESSURE
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Destination As Midi.MidiFile)
		  mLastError = HP_InsertChannelPressure(Destination.Handle, mTime, mChannel, mPressure)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mPressure As Int32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPressure
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLastError = HP_ChangeChannelPressure(mMidiFile.Handle, mEventID, value)
			  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
			End Set
		#tag EndSetter
		Pressure As Int32
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
