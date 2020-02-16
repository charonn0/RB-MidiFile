#tag Class
Protected Class MidiEvent
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ID As Int32, Channel As Int32, Time As Int32, Type As Midi.EventType)
		  mEventID = ID
		  mChannel = Channel
		  mTime = Time
		  mType = Type
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
		Protected mChannel As Int32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mEventID As Int32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mTime As Int32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mType As Midi.EventType
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTime
			End Get
		#tag EndGetter
		Time As Int32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mType
			End Get
		#tag EndGetter
		Type As Midi.EventType
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