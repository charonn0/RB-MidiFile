#tag Module
Protected Module Midi
	#tag Method, Flags = &h21
		Private Function AbsolutePath_(Extends f As FolderItem) As String
		  #If RBVersion > 2019 Then
		    Return f.NativePath
		  #Else
		    Return f.AbsolutePath
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ChangeChannelInBuffer(Channel As Int32)
		  If IsAvailable And Channel >= 0 And Channel <= 15 Then HP_ChangeChannelInBuffer(Channel)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function EventName(Type As Midi.EventType) As String
		  If Not IsAvailable() Then Return ""
		  Dim mb As MemoryBlock = HP_TypeName(Type)
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FormatError(ErrorCode As ErrorCodes) As String
		  ' Translates library error numbers to messages
		  
		  If Not IsAvailable Then Return "HP MIDIFILE is not available or is an unsupported version."
		  Dim msg As CString = HP_ErrText(ErrorCode)
		  Return msg
		  
		  
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub HP_ChangeChannelInBuffer Lib "HP_midifile" Alias "?HP_ChangeChannelInBuffer@@YAXH@Z" (Channel As Int32)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_ChangeNote Lib "HP_midifile" Alias "?HP_ChangeNote@@YAIPAVMIDIFile@@HHH_N@Z" (MIDIFile As Ptr, ID As Int32, Channel As Int32, Note As Int32, Absolute As Boolean) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_ChangePPQN Lib "HP_midifile" Alias "?HP_ChangePPQN@@YAIPAVMIDIFile@@H@Z" (MIDIFile As Ptr, PPQN As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_Copy Lib "HP_midifile" Alias "?HP_Copy@@YAIPAVMIDIFile@@@Z" (MIDIFile As Ptr) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub HP_Delete Lib "HP_midifile" Alias "?HP_Delete@@YAXPAX@Z" (mb As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_Deselect Lib "HP_midifile" Alias "?HP_Deselect@@YAIPAVMIDIFile@@H@Z" (MidiFile As Ptr, EventID As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_DeselectChan Lib "HP_midifile" Alias "?HP_DeselectChan@@YAIPAVMIDIFile@@H@Z" (MidiFile As Ptr, Channel As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_Duration Lib "HP_midifile" Alias "?HP_Duration@@YAJPAVMIDIFile@@H@Z" (MIDIFile As Ptr, Mode As Int32) As Int32
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_ErrText Lib "HP_midifile" Alias "?HP_ErrText@@YAPADH@Z" (ErrNo As ErrorCodes) As CString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_Free Lib "HP_midifile" Alias "?HP_Free@@YAIPAVMIDIFile@@@Z" (MIDIFile As Ptr) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_GetLastTime Lib "HP_midifile" Alias "?HP_GetLastTime@@YAIPAVMIDIFile@@PAH@Z" (MIDIFile As Ptr, ByRef Time As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_GetMIDIDevices Lib "HP_midifile" Alias "?HP_GetMIDIDevices@@YAIPAPAUHP_device@@PAH@Z" (ByRef Devices As Ptr, ByRef Count As UInt32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_GetTaktBeatTick Lib "HP_midifile" Alias "?HP_GetTaktBeatTick@@YAIPAVMIDIFile@@HPAH11@Z" (MIDIFile As Ptr, Time As Int32, ByRef Takt As Int32, ByRef Beat As Int32, ByRef Tick As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_GetTaktBeatTick Lib "HP_midifile" Alias "?HP_GetTaktBeatTick@@YAIPAVMIDIFile@@HHHHHPAH11@Z" (MIDIFile As Ptr, Time As Int32, TimeOfLastTimeSignature As Int32, TaktOfLastTimeSignature As Int32, Num As Int32, Denum As Int32, ByRef Takt As Int32, ByRef Beat As Int32, ByRef Tick As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_GetTimeFromTaktBeatTick Lib "HP_midifile" Alias "?HP_GetTimeFromTaktBeatTick@@YAIPAVMIDIFile@@HHHPAH@Z" (MIDIFile As Ptr, Takt As Int32, Beat As Int32, Tick As Int32, ByRef Time As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_GetVersion Lib "HP_midifile" Alias "?HP_GetVersion@@YAPADXZ" () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_Init Lib "HP_midifile" Alias "?HP_Init@@YAPAVMIDIFile@@XZ" () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_InsertAftertouch Lib "HP_midifile" Alias "?HP_InsertAftertouch@@YAIPAVMIDIFile@@HHHH@Z" (MIDIFile As Ptr, Time As Int32, Channel As Int32, Note As Int32, Pressure As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_InsertNote Lib "HP_midifile" Alias "?HP_InsertNote@@YAIPAVMIDIFile@@HHHHH@Z" (MIDIFile As Ptr, Time As Int32, Length As Int32, Note As Int32, Channel As Int32, Velocity As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_InsertRawEvent Lib "HP_midifile" Alias "?HP_InsertRawEvent@@YAIPAVMIDIFile@@HPAEHH@Z" (MIDIFile As Ptr, Time As Int32, Data As Ptr, Length As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_IsPlaying Lib "HP_midifile" Alias "?HP_IsPlaying@@YA_NPAVMIDIFile@@@Z" (MIDIFile As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_Load Lib "HP_midifile" Alias "?HP_Load@@YAIPAVMIDIFile@@PBD@Z" (MIDIFile As Ptr, Path As CString) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_Paste Lib "HP_midifile" Alias "?HP_Paste@@YAIPAVMIDIFile@@H_NH@Z" (MIDIFile As Ptr, Time As Int32, DeleteInDest As Boolean, DelEventsChan As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_Play Lib "HP_midifile" Alias "?HP_Play@@YAIPAVMIDIFile@@H_N@Z" (MIDIFile As Ptr, SelectedEvents As Integer, SendBefore As Boolean) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_PlayEventTime Lib "HP_midifile" Alias "?HP_PlayEventTime@@YAJPAVMIDIFile@@@Z" (MIDIFile As Ptr) As Int32
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_PlayTempo Lib "HP_midifile" Alias "?HP_PlayTempo@@YAIPAVMIDIFile@@H@Z" (MIDIFile As Ptr, Percent As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_PlayTime Lib "HP_midifile" Alias "?HP_PlayTime@@YAJPAVMIDIFile@@@Z" (MIDIFile As Ptr) As Int32
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_ReadAftertouch Lib "HP_midifile" Alias "?HP_ReadAftertouch@@YAIPAVMIDIFile@@HPAH111@Z" (MIDIFile As Ptr, EventID As Int32, ByRef Time As Int32, ByRef Channel As Int32, ByRef Note As Int32, ByRef Pressure As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_ReadChannelPressure Lib "HP_midifile" Alias "?HP_ReadChannelPressure@@YAIPAVMIDIFile@@HPAH11@Z" (MIDIFile As Ptr, EventID As Int32, ByRef Time As Int32, ByRef Channel As Int32, ByRef Pressure As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_ReadController Lib "HP_midifile" Alias "?HP_ReadController@@YAIPAVMIDIFile@@HPAH111@Z" (MIDIFile As Ptr, EventID As Int32, ByRef Time As Int32, ByRef Channel As Int32, ByRef Number As Int32, ByRef Value As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_ReadEvent Lib "HP_midifile" Alias "?HP_ReadEvent@@YAIPAVMIDIFile@@PAH111@Z" (MIDIFile As Ptr, ByRef ID As Int32, ByRef Channel As Int32, ByRef Time As Int32, ByRef Type As UInt32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_ReadNote Lib "HP_midifile" Alias "?HP_ReadNote@@YAIPAVMIDIFile@@HPAH1111@Z" (MIDIFile As Ptr, EventID As Int32, ByRef Time As Int32, ByRef Channel As Int32, ByRef Note As Int32, ByRef Velocity As Int32, ByRef Length As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_ReadNRPN Lib "HP_midifile" Alias "?HP_ReadNRPN@@YAIPAVMIDIFile@@HPAH1PA_N11@Z" (MIDIFile As Ptr, EventID As Int32, ByRef Time As Int32, ByRef Channel As Int32, ByRef Absolute As Boolean, ByRef Number As Int32, ByRef Value As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_ReadPitchWheel Lib "HP_midifile" Alias "?HP_ReadPitchWheel@@YAIPAVMIDIFile@@HPAH11@Z" (MIDIFile As Ptr, EventID As Int32, ByRef Time As Int32, ByRef Channel As Int32, ByRef Value As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_ReadPPQN Lib "HP_midifile" Alias "?HP_ReadPPQN@@YAIPAVMIDIFile@@PAH@Z" (MIDIFile As Ptr, ByRef PPQN As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_ReadProgramChange Lib "HP_midifile" Alias "?HP_ReadProgramChange@@YAIPAVMIDIFile@@HPAH11@Z" (MIDIFile As Ptr, EventID As Int32, ByRef Time As Int32, ByRef Channel As Int32, ByRef Number As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_ReadRPN Lib "HP_midifile" Alias "?HP_ReadRPN@@YAIPAVMIDIFile@@HPAH1PA_N11@Z" (MIDIFile As Ptr, EventID As Int32, ByRef Time As Int32, ByRef Channel As Int32, ByRef Absolute As Boolean, ByRef Number As Int32, ByRef Value As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_ReadSysEx Lib "HP_midifile" Alias "?HP_ReadSysex@@YAIPAVMIDIFile@@HPAHPAPAE1@Z" (MIDIFile As Ptr, EventID As Int32, ByRef Time As Int32, ByRef Data As Ptr, ByRef Length As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_Save Lib "HP_midifile" Alias "?HP_Save@@YAIPAVMIDIFile@@PBDH@Z" (MIDIFile As Ptr, Path As CString, Format As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_Select Lib "HP_midifile" Alias "?HP_Select@@YAIPAVMIDIFile@@H@Z" (MidiFile As Ptr, EventID As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_SelectChanTime Lib "HP_midifile" Alias "?HP_SelectChanTime@@YAIPAVMIDIFile@@HHH@Z" (MidiFile As Ptr, Channel As Int32, Time1 As Int32, Time2 As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_SelectMIDIDevice Lib "HP_midifile" Alias "?HP_SelectMIDIDevice@@YAIH@Z" (ID As Integer) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_SetPlayStopWait Lib "HP_midifile" Alias "?HP_SetPlayStopWait@@YAIPAVMIDIFile@@H@Z" (MIDIFile As Ptr, Mode As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_SetPlayTime Lib "HP_midifile" Alias "?HP_SetPlayTime@@YAIPAVMIDIFile@@H@Z" (MIDIFile As Ptr, NewTime As Int32) As ErrorCodes
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function HP_TypeName Lib "HP_midifile" Alias "?HP_TypeName@@YAPADI@Z" (Type As EventType) As Ptr
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
		BINDING_ERROR=-1
	#tag EndEnum

	#tag Enum, Name = EventType, Type = Integer, Flags = &h1
		NOTE=&h000200
		  AFTERTOUCH=&h000300
		  CONTROLLER_TYPE=&h000400
		  BANK_SELECT_MSB=&h010400
		  MODULATION=&h020400
		  BREATH=&h030400
		  PORTAMENTO_TIME=&h040400
		  MAIN_VOLUME=&h050400
		  PANPOT=&h060400
		  EXPRESSION=&h070400
		  BANK_SELECT_LSB=&h080400
		  SUSTAIN=&h090400
		  PORTAMENTO=&h0a0400
		  SOSTENUTO=&h0b0400
		  SOFT_PEDAL=&h0c0400
		  HARMONIC_CONTENT=&h0d0400
		  RELEASE_TIME=&h0e0400
		  ATTACK_TIME=&h0f0400
		  BRIGHTNESS=&h100400
		  DECAY_TIME=&h110400
		  VIBRATO_RATE=&h120400
		  VIBRATO_DEPTH=&h130400
		  VIBRATO_DELAY=&h140400
		  PORTAMENTO_CONTROL=&h150400
		  REVERB_SEND_LEVEL=&h160400
		  CHORUS_SEND_LEVEL=&h170400
		  VARIATION_SEND_LEVEL=&h180400
		  NRPN=&h190400
		  RPN=&h1a0400
		  ALL_SOUND_OFF=&h1b0400
		  RESET_ALL_CONTROLLERS=&h1c0400
		  ALL_NOTES_OFF=&h1d0400
		  OMNI_OFF=&h1e0400
		  OMNI_ON=&h1f0400
		  MONO=&h200400
		  POLY=&h210400
		  PROGRAM_CHANGE=&h000500
		  CHANNEL_PRESSURE=&h000600
		  PITCH_WHEEL=&h000700
		  SYSEX=&h000800
		  SEQUENCE_NUMBER=&h000101
		  TEXT=&h000201
		  COPYRIGHT=&h000301
		  SONG_TRACK_NAME=&h000401
		  INSTRUMENT=&h000501
		  LYRIC=&h000601
		  MARKER=&h000701
		  CUE_POINT=&h000801
		  CHANNEL_PREFIX=&h000901
		  MIDI_PORT=&h000a01
		  END_OF_TRACK=&h000b01
		  TEMPO=&h000c01
		  SMPTE_OFFSET=&h000d01
		  TIME_SIGNATURE=&h000e01
		  KEY_SIGNATURE=&h000f01
		  OTHER_META=&h00fe01
		  SCORE_START_BAR=&h01ff01
		  QUICK_START=&h02ff01
		  SCORE_LAYOUT=&h03ff01
		  KEYBOARD_VOICE=&h04ff01
		  XF_VERSION_ID=&h41ff01
		  CHORD_NAME=&h42ff01
		  REHEARSAL_MARK=&h43ff01
		  PHRASE_MARK=&h44ff01
		  MAX_PHRASE_MARK=&h45ff01
		  FINGERING_NUMBER=&h46ff01
		  GUIDE_TRACK_FLAG=&h47ff01
		  GUITAR_INFORMATION_FLAG=&h48ff01
		  CHORD_VOICING_FOR_GUITAR=&h49ff01
		  LYRICS_BITMAP=&h4aff01
		  OTHER_YAMAHA_META=&h00ff01
		RAW_EVENT=&h000002
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
