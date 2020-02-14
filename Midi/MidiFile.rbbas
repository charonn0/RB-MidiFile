#tag Class
Protected Class MidiFile
	#tag Method, Flags = &h0
		Sub Constructor()
		  If Not Midi.IsAvailable Then Raise New MidiException
		  mMidi = HP_Init()
		  If mMidi = Nil Then Raise New MidiException
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Copy()
		  mLastError = HP_Copy(mMidi)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mMidi <> Nil Then mLastError = HP_Free(mMidi)
		  mMidi = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertRawEvent(Time As Int32, RawEvent As MemoryBlock)
		  mLastError = HP_InsertRawEvent(mMidi, Time, RawEvent, RawEvent.Size)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(MidiFile As FolderItem)
		  mLastError = HP_Load(mMidi, MidiFile.AbsolutePath)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paste(Time As Int32, DeleteInDestination As Boolean, DeleteMode As Int32 = HP_ALL_EVENTS)
		  mLastError = HP_Paste(mMidi, Time, DeleteInDestination, DeleteMode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(MidiFile As FolderItem, Format As Int32 = HP_SMF0)
		  mLastError = HP_Save(mMidi, MidiFile.AbsolutePath, Format)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Const HP_ALL = 1
			  If mMidi <> Nil Then Return HP_Duration(mMidi, HP_ALL)
			End Get
		#tag EndGetter
		Duration As Int32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mMidi
			End Get
		#tag EndGetter
		Handle As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLastError
			End Get
		#tag EndGetter
		LastError As Midi.ErrorCodes
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mLastError As Midi.ErrorCodes
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMidi As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMidi <> Nil Then
			    Dim value As Int32
			    mLastError = HP_ReadPPQN(mMidi, value)
			    If mLastError = ErrorCodes.None Then Return value
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMidi <> Nil Then mLastError = HP_ChangePPQN(mMidi, value)
			  
			End Set
		#tag EndSetter
		PPQN As Int32
	#tag EndComputedProperty


	#tag Constant, Name = HP_ALL_EVENTS, Type = Double, Dynamic = False, Default = \"-2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HP_NO_CHAN, Type = Double, Dynamic = False, Default = \"-1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HP_SMF0, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HP_SMF1, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


End Class
#tag EndClass
