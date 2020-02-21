#tag Class
Protected Class ChannelPressureEvent
Inherits Midi.Events.MidiEvent
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, EventID As Int32)
		  Super.Constructor(MidiFile)
		  Dim err As ErrorCodes = HP_ReadChannelPressure(MidiFile.Handle, EventID, mTime, mChannel, mPressure)
		  If err <> ErrorCodes.None Then Raise New MidiException(err)
		  mType = EventType.CHANNEL_PRESSURE
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
			  Dim err As ErrorCodes = HP_ChangeChannelPressure(mMidiFile.Handle, mEventID, value)
			  If err <> ErrorCodes.None Then Raise New MidiException(err)
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
