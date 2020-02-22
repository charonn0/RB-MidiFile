#tag Class
Protected Class InstrumentDefinitionFile
	#tag Method, Flags = &h0
		Sub Constructor(MidiFile As Midi.MidiFile, Definitions As FolderItem)
		  mMidiFile = MidiFile
		  Me.Load(Definitions)
		  If mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(Definitions As FolderItem)
		  mLastError = HP_CWInsLoad(mMidiFile.Handle, Definitions.AbsolutePath_)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetInstrument(Index As Integer)
		  mLastError = HP_CWInsSetDef(mMidiFile.Handle, Index)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMidiFile <> Nil Then Return New Midi.Lists.BankList(Me)
			End Get
		#tag EndGetter
		Banks As Midi.DefinitionList
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMidiFile <> Nil Then Return mMidiFile.Handle
			End Get
		#tag EndGetter
		Handle As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMidiFile <> Nil Then Return New Midi.Lists.InstrumentList(Me)
			End Get
		#tag EndGetter
		Instruments As Midi.DefinitionList
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mLastError As Midi.ErrorCodes
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMidiFile As Midi.MidiFile
	#tag EndProperty


End Class
#tag EndClass
