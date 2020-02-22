#tag Class
Protected Class InstrumentList
Inherits DefinitionList
	#tag Method, Flags = &h0
		Sub Constructor(Definitions As Midi.InstrumentDefinitionFile)
		  mLastError = HP_CWInsGetDefs(Definitions.Handle, mList, mCount)
		  If mList = Nil Or mLastError <> ErrorCodes.None Then Raise New MidiException(mLastError)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(Index As Integer) As String
		  If Index > Count - 1 Or Index < 0 Then Raise New OutOfBoundsException
		  Dim c As Integer
		  Dim lst As Ptr = mList
		  Do Until lst = Nil
		    If c = Index Then
		      Dim def As HP_CWDEF = lst.HP_CWDEF
		      Return def.Name.Trim
		    ElseIf Index < Count Then
		      lst = Ptr(Integer(lst) + HP_CWDEF.Size)
		    End If
		    c = c + 1
		  Loop Until c > Count - 1
		  
		End Function
	#tag EndMethod


End Class
#tag EndClass
