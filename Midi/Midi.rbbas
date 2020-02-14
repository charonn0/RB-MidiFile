#tag Module
Protected Module Midi
	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub HP_Delete Lib "HP_midifile" Alias "?HP_Delete@@YAXPAX@Z" (mb As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_Duration Lib "HP_midifile" Alias "?HP_Duration@@YAJPAVMIDIFile@@H@Z" (MIDIFile As Ptr, Mode As Int32) As Int32
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_Free Lib "HP_midifile" Alias "?HP_Free@@YAIPAVMIDIFile@@@Z" (MIDIFile As Ptr) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_GetMIDIDevices Lib "HP_midifile" Alias "?HP_GetMIDIDevices@@YAIPAPAUHP_device@@PAH@Z" (ByRef Devices As Ptr, ByRef Count As UInt32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_GetVersion Lib "HP_midifile" Alias "?HP_GetVersion@@YAPADXZ" () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_Init Lib "HP_midifile" Alias "?HP_Init@@YAPAVMIDIFile@@XZ" () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_IsPlaying Lib "HP_midifile" Alias "?HP_IsPlaying@@YA_NPAVMIDIFile@@@Z" (MIDIFile As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_Load Lib "HP_midifile" Alias "?HP_Load@@YAIPAVMIDIFile@@PBD@Z" (MIDIFile As Ptr, Path As CString) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_Play Lib "HP_midifile" Alias "?HP_Play@@YAIPAVMIDIFile@@H_N@Z" (MIDIFile As Ptr, SelectedEvents As Integer, SendBefore As Boolean) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_PlayTime Lib "HP_midifile" Alias "?HP_PlayTime@@YAJPAVMIDIFile@@@Z" (MIDIFile As Ptr) As Int32
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_SelectMIDIDevice Lib "HP_midifile" Alias "?HP_SelectMIDIDevice@@YAIH@Z" (ID As Integer) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_SetPlayStopWait Lib "HP_midifile" (MIDIFile As Ptr, Mode As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_SetPlayTime Lib "HP_midifile" Alias "?HP_SetPlayTime@@YAIPAVMIDIFile@@H@Z" (MIDIFile As Ptr, NewTime As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function IsAvailable() As Boolean
		  Static avail As Boolean
		  If Not avail Then avail = System.IsFunctionAvailable("?HP_GetVersion@@YAPADXZ", "HP_midifile")
		  Return avail
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SelectMidiDevice(Device As Midi.Device) As Midi.ErrorCodes
		  If Device <> Nil Then Return HP_SelectMIDIDevice(Device.ID)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Version() As String
		  If Not IsAvailable Then Return ""
		  Dim mb As MemoryBlock = HP_GetVersion()
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod


	#tag Structure, Name = HP_DEVICE, Flags = &h21
		ID As Int32
		Name As String*32
	#tag EndStructure


	#tag Enum, Name = ErrorCodes, Type = Integer, Flags = &h1
		None=0
		  Busy=1
		  Uninitialized=2
		  MidiDevice=3
		  AllocatedDevice=4
		  Play=5
		  OutputFormat=6
		  Load=7
		  FileNotfound=8
		  FileNotopen=9
		  FileFormat=10
		  FileBad=11
		  Memory=12
		  InvalidParam=13
		  InvalidDenum=14
		  InvalidPpqn=15
		  NoPpqn=16
		  InvalidSysex=17
		  Eventtype=18
		  Eventdata=19
		  Sequencenumber=20
		  Key=21
		  BadId=22
		  Delete=23
		  BadController=24
		  BadNewNote=25
		  BadSmpteOffset=26
		  BadShift=27
		  BadTranspose=28
		  Quantisize=29
		  RangeEventlist=30
		  CwinsfileNotfound=31
		  Cwinsfile=32
		  CwinsDefIndex=33
		  CwinsFileMissed=34
		  CwinsLabelMissed=35
		  CwinsNoInstrumentDefinitionList=36
		  CwinsNoName=37
		  CwinsNoInstrument=38
		  CwinsNoDrumLines=39
		PlayNoMidievent=40
	#tag EndEnum


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
