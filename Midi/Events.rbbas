#tag Module
Protected Module Events
	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_ReadNote Lib "HP_midifile" Alias "?HP_ReadNote@@YAIPAVMIDIFile@@HPAH1111@Z" (MIDIFile As Ptr, EventID As Int32, ByRef Time As Int32, ByRef Channel As Int32, ByRef Note As Int32, ByRef Velocity As Int32, ByRef Length As Int32) As ErrorCodes
	#tag EndExternalMethod


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
End Module
#tag EndModule
