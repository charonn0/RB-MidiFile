#tag Class
Protected Class EventSource
Inherits MidiFile
	#tag Method, Flags = &h0
		Function GetNextEvent() As Boolean
		  Dim id, chan, time As Int32
		  Dim type As UInt32
		  
		  mLastError = HP_ReadEvent(Me.Handle, id, chan, time, type)
		  If mLastError = ErrorCodes.None Then
		    Select Case Ctype(type, Midi.EventType)
		    Case EventType.Note
		      mCurrentEvent = New Midi.Events.NoteEvent(Me, id)
		      
		    Case EventType.Aftertouch
		      mCurrentEvent = New Midi.Events.AfterTouchEvent(Me, id)
		      
		    Case EventType.Controller
		      mCurrentEvent = New Midi.Events.ControllerEvent(Me, id)
		      
		    Case EventType.RPN_NRPN
		      mCurrentEvent = New Midi.Events.RPNEvent(Me, id)
		      
		    Case EventType.ProgramChange
		      mCurrentEvent = New Midi.Events.ProgramChangeEvent(Me, id)
		      
		    Case EventType.ChannelPressure
		      mCurrentEvent = New Midi.Events.ChannelPressureEvent(Me, id)
		      
		    Case EventType.PitchWheel
		      mCurrentEvent = New Midi.Events.PitchWheelEvent(Me, id)
		      
		    Else
		      mCurrentEvent = New Midi.Events.MidiEvent(id, chan, time, Ctype(type, Midi.EventType))
		      
		    End Select
		    Return True
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(MidiFile As FolderItem)
		  Super.Load(MidiFile)
		  Call GetNextEvent()
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCurrentEvent
			End Get
		#tag EndGetter
		CurrentEvent As Midi.Events.MidiEvent
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCurrentEvent As Midi.Events.MidiEvent
	#tag EndProperty


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
