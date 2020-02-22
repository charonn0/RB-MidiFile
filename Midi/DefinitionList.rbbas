#tag Class
Protected Class DefinitionList
	#tag Method, Flags = &h1
		Protected Sub Constructor(StructSize As Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Return mCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mList <> Nil Then HP_Delete(mList)
		  mList = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetItem(Index As Integer) As Ptr
		  If Index > Count - 1 Or Index < 0 Then Raise New OutOfBoundsException
		  Dim c As Integer
		  Dim lst As Ptr = mList
		  Do Until lst = Nil
		    If c = Index Then
		      Return lst
		    ElseIf Index < Count Then
		      lst = Ptr(Integer(lst) + mSize)
		    End If
		    c = c + 1
		  Loop Until c > Count - 1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(Index As Integer) As String
		  #pragma Unused Index
		  Raise New RuntimeException
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String()
		  Dim c As Integer
		  Dim lst As Ptr = mList
		  Dim ret() As String
		  Do Until lst = Nil
		    Dim def As HP_CWDEF = lst.HP_CWDEF
		    ret.Append(def.Name.Trim)
		    lst = Ptr(Integer(lst) + HP_CWDEF.Size)
		    c = c + 1
		  Loop Until c > Count - 1
		  Return ret
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mCount As Int32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLastError As ErrorCodes
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mList As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSize As Integer
	#tag EndProperty


End Class
#tag EndClass
