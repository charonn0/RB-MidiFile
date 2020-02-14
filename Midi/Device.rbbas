#tag Class
Protected Class Device
	#tag Method, Flags = &h1
		Protected Sub Constructor(DevInfo As HP_DEVICE)
		  mID = DevInfo.ID
		  mName = DevInfo.Name.Trim()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetDevice(Index As Integer) As Midi.Device
		  If Not Midi.IsAvailable Then Raise New MidiException
		  Dim devlist As Ptr
		  Dim devcount As UInt32
		  Dim err As ErrorCodes
		  
		  err = HP_GetMIDIDevices(devlist, devcount)
		  If err <> ErrorCodes.None Then Raise New MidiException
		  If Index > devcount Then Raise New OutOfBoundsException
		  Dim item As Ptr = devlist
		  Dim c As Integer
		  Dim dev As Device
		  Do Until item = Nil
		    If Index = c Then
		      dev = New Device(item.HP_DEVICE)
		      Exit Do
		    End If
		    item = Ptr(Integer(item) + HP_DEVICE.Size)
		    c = c + 1
		  Loop
		  
		  Call HP_Delete(devlist)
		  Return dev
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Not Midi.IsAvailable Then Return 0
			  Dim devlist As Ptr
			  Dim devcount As UInt32
			  Dim err As ErrorCodes
			  
			  err = HP_GetMIDIDevices(devlist, devcount)
			  Call HP_Delete(devlist)
			  If err <> ErrorCodes.None Then Return 0
			  Return devcount
			  
			End Get
		#tag EndGetter
		Shared Count As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mID
			End Get
		#tag EndGetter
		ID As Int32
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mID As Int32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mName
			End Get
		#tag EndGetter
		Name As String
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
