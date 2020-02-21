#tag Class
Protected Class ControllerEvent
Inherits Midi.Events.MidiEvent
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, EventID As Int32)
		  Super.Constructor(MidiFile)
		  Dim err As ErrorCodes = HP_ReadController(MidiFile.Handle, EventID, mTime, mChannel, mNumber, mValue)
		  If err <> ErrorCodes.None Then Raise New MidiException(err)
		  mType = EventType.CONTROLLER_TYPE
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mNumber As Int32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mValue As Int32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mNumber
			End Get
		#tag EndGetter
		Number As Int32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mValue
			End Get
		#tag EndGetter
		Value As Int32
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
