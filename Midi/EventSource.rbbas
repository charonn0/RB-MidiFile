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
		      
		    Case EventType.TEXT
		      mCurrentEvent = New Midi.Events.TextEvent(mSource, id)
		      
		    Case EventType.COPYRIGHT
		      mCurrentEvent = New Midi.Events.CopyRightEvent(mSource, id)
		      
		    Case EventType.SONG_TRACK_NAME
		      mCurrentEvent = New Midi.Events.SongTrackNameEvent(mSource, id)
		      
		    Case EventType.INSTRUMENT
		      mCurrentEvent = New Midi.Events.InstrumentEvent(mSource, id)
		      
		    Case EventType.LYRIC
		      mCurrentEvent = New Midi.Events.LyricEvent(mSource, id)
		      
		    Case EventType.MARKER
		      mCurrentEvent = New Midi.Events.MarkerEvent(mSource, id)
		      
		    Case EventType.MIDI_PORT
		      mCurrentEvent = New Midi.Events.MidiPortEvent(mSource, id)
		      
		    Case EventType.CUE_POINT
		      mCurrentEvent = New Midi.Events.CuePointEvent(mSource, id)
		      
		    Case EventType.TEMPO
		      mCurrentEvent = New Midi.Events.TempoEvent(mSource, id)
		      
		    Case EventType.SMPTE_OFFSET
		      mCurrentEvent = New Midi.Events.SmpteOffsetEvent(mSource, id)
		      
		    Case EventType.TIME_SIGNATURE
		      mCurrentEvent = New Midi.Events.TimeSignatureEvent(mSource, id)
		      
		    Case EventType.KEY_SIGNATURE
		      mCurrentEvent = New Midi.Events.KeySignatureEvent(mSource, id)
		      
		    Case EventType.SYSEX
		      mCurrentEvent = New Midi.Events.SysExEvent(mSource, id)
		      
		    Case EventType.SCORE_START_BAR
		      mCurrentEvent = New Midi.Events.ScoreStartBarEvent(mSource, id)
		      
		    Case EventType.SCORE_LAYOUT
		      mCurrentEvent = New Midi.Events.ScoreLayoutEvent(mSource, id)
		      
		    Case EventType.QUICK_START
		      mCurrentEvent = New Midi.Events.QuickStartEvent(mSource, id)
		      
		    Case EventType.KEYBOARD_VOICE
		      mCurrentEvent = New Midi.Events.KeyboardVoiceEvent(mSource, id)
		      
		    Case EventType.XF_VERSION_ID
		      mCurrentEvent = New Midi.Events.XFVersionIDEvent(mSource, id)
		      
		    Case EventType.REHEARSAL_MARK
		      mCurrentEvent = New Midi.Events.RehearsalMarkEvent(mSource, id)
		      
		    Case EventType.PHRASE_MARK
		      mCurrentEvent = New Midi.Events.PhraseMarkEvent(mSource, id)
		      
		    Case EventType.MAX_PHRASE_MARK
		      mCurrentEvent = New Midi.Events.MaxPhraseMarkEvent(mSource, id)
		      
		    Case EventType.FINGERING_NUMBER
		      mCurrentEvent = New Midi.Events.FingeringNumberEvent(mSource, id)
		      
		    Case EventType.GUIDE_TRACK_FLAG
		      mCurrentEvent = New Midi.Events.GuideTrackFlagEvent(mSource, id)
		      
		    Case EventType.GUITAR_INFORMATION_FLAG
		      mCurrentEvent = New Midi.Events.GuitarInformationFlagEvent(mSource, id)
		      
		    Case EventType.CHORD_VOICING_FOR_GUITAR
		      mCurrentEvent = New Midi.Events.ChordVoicingForGuitarEvent(mSource, id)
		      
		    Case EventType.OTHER_YAMAHA_META
		      mCurrentEvent = New Midi.Events.YamahaEvent(mSource, id)
		      
		    Case EventType.CHORD_NAME
		      mCurrentEvent = New Midi.Events.ChordEvent(mSource, id)
		      
		    Else
		      mCurrentEvent = New Midi.MidiEvent(id, chan, time, Ctype(type, Midi.EventType))
		      
		    End Select
		    If time <> mCurrentEvent.Time Or chan <> mCurrentEvent.Channel Then Break
		    Return True
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rewind()
		  mLastError = HP_Rewind(mSource.Handle)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCurrentEvent
			End Get
		#tag EndGetter
		CurrentEvent As Midi.MidiEvent
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCurrentEvent As Midi.MidiEvent
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
