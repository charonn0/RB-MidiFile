#tag Class
Protected Class EventSource
	#tag Method, Flags = &h0
		Sub Constructor(Source As Midi.MidiFile)
		  mSource = Source
		  If Not GetNextEvent() Then Raise New MidiException(ErrorCodes.BINDING_ERROR)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNextEvent() As Boolean
		  Dim id, chan, time As Int32
		  Dim type As UInt32
		  
		  mLastError = HP_ReadEvent(mSource.Handle, id, chan, time, type)
		  If mLastError = ErrorCodes.None Then
		    Select Case Ctype(type, Midi.EventType)
		    Case EventType.NOTE
		      mCurrentEvent = New Midi.Events.NoteEvent(mSource, id)
		      
		    Case EventType.AFTERTOUCH
		      mCurrentEvent = New Midi.Events.AfterTouchEvent(mSource, id)
		      
		    Case EventType.CONTROLLER_TYPE
		      mCurrentEvent = New Midi.Events.ControllerEvent(mSource, id)
		      
		    Case EventType.RPN
		      mCurrentEvent = New Midi.Events.RPNEvent(mSource, id)
		      
		    Case EventType.PROGRAM_CHANGE
		      mCurrentEvent = New Midi.Events.ProgramChangeEvent(mSource, id)
		      
		    Case EventType.CHANNEL_PRESSURE
		      mCurrentEvent = New Midi.Events.ChannelPressureEvent(mSource, id)
		      
		    Case EventType.PITCH_WHEEL
		      mCurrentEvent = New Midi.Events.PitchWheelEvent(mSource, id)
		      
		    Else
		      mCurrentEvent = New Midi.Events.MidiEvent(id, chan, time, Ctype(type, Midi.EventType))
		      
		    End Select
		    Return True
		  End If
		  
		End Function
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

	#tag Property, Flags = &h21
		Private mLastError As Midi.ErrorCodes
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSource As MidiFile
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
