#tag Class
Protected Class BankList
Inherits DefinitionList
	#tag Method, Flags = &h0
		Sub Constructor(Definitions As Midi.InstrumentDefinitionFile)
		  Super.Constructor(HP_CWBANK.Size)
		  mLastError = HP_CWInsGetBanks(Definitions.Handle, mList, mCount)
		  If mList = Nil Or mLastError <> ErrorCodes.None Then
		    If mLastError <> ErrorCodes.CwinsNoInstrument Then Raise New MidiException(mLastError)
		  End If
		  mDefs = Definitions
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(Index As Integer) As String
		  Dim def As HP_CWBANK = Me.GetItem(Index).HP_CWBANK
		  Return def.BankName.Trim
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemNumber(Index As Integer) As Int32
		  Dim def As HP_CWBANK = Me.GetItem(Index).HP_CWBANK
		  Return def.BankNumber
		  
		End Function
	#tag EndMethod


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
