#tag Window
Begin Window EventList
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   1.62e+2
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Event List"
   Visible         =   True
   Width           =   6.41e+2
   Begin Listbox EventList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   6
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   True
      EnableDragReorder=   True
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   162
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Type	Time	Channel	Length	Value	Modifier"
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   1
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   641
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub AddEventRow(EventData As Midi.Events.MidiEvent)
		  Dim name, time, channel, length, value, modifier As String
		  name = Midi.EventName(EventData.Type)
		  If name = "No Type Found" Then name = name + "(" + Hex(EventData.Type) + ")"
		  time = FormatTime(EventData.Time)
		  channel = Str(EventData.Channel)
		  
		  Select Case EventData.Type
		  Case Midi.EventType.NOTE
		    Dim note As Midi.Events.NoteEvent = Midi.Events.NoteEvent(EventData)
		    length = Str(note.Length)
		    value = Str(note.Note)
		    modifier = Str(note.Velocity)
		    
		  Case Midi.EventType.AFTERTOUCH
		    Dim atevent As Midi.Events.AfterTouchEvent = Midi.Events.AfterTouchEvent(EventData)
		    value = Str(atevent.Note)
		    modifier = Str(atevent.Pressure)
		    
		  Case Midi.EventType.CONTROLLER_TYPE
		    Dim ctlevent As Midi.Events.ControllerEvent = Midi.Events.ControllerEvent(EventData)
		    value = Str(ctlevent.Value)
		    modifier = Str(ctlevent.Number)
		    
		  Case Midi.EventType.RPN
		    Dim rpnevent As Midi.Events.RPNEvent = Midi.Events.RPNEvent(EventData)
		    value = Str(rpnevent.Value)
		    modifier = Str(rpnevent.Number)
		    
		  Case Midi.EventType.PROGRAM_CHANGE
		    Dim pcevent As Midi.Events.ProgramChangeEvent = Midi.Events.ProgramChangeEvent(EventData)
		    value = Str(pcevent.Voice)
		    
		  Case Midi.EventType.CHANNEL_PRESSURE
		    Dim cpevent As Midi.Events.ChannelPressureEvent = Midi.Events.ChannelPressureEvent(EventData)
		    value = Str(cpevent.Pressure)
		    
		  Case Midi.EventType.PITCH_WHEEL
		    Dim pwevent As Midi.Events.PitchWheelEvent = Midi.Events.PitchWheelEvent(EventData)
		    value = Str(pwevent.Value)
		    
		  Case Midi.EventType.COPYRIGHT
		    Dim cpevent As Midi.Events.CopyRightEvent = Midi.Events.CopyRightEvent(EventData)
		    value = cpevent.Text
		    
		  Case Midi.EventType.CUE_POINT
		    Dim cpevent As Midi.Events.CuePointEvent = Midi.Events.CuePointEvent(EventData)
		    value = cpevent.Text
		    
		  Case Midi.EventType.INSTRUMENT
		    Dim ievent As Midi.Events.InstrumentEvent = Midi.Events.InstrumentEvent(EventData)
		    value = ievent.Text
		    
		  Case Midi.EventType.KEY_SIGNATURE
		    Dim ksevent As Midi.Events.KeySignatureEvent = Midi.Events.KeySignatureEvent(EventData)
		    value = ksevent.Text
		    
		  Case Midi.EventType.LYRIC
		    Dim levent As Midi.Events.LyricEvent = Midi.Events.LyricEvent(EventData)
		    value = levent.Text
		    
		  Case Midi.EventType.MARKER
		    Dim mevent As Midi.Events.MarkerEvent = Midi.Events.MarkerEvent(EventData)
		    value = mevent.Text
		    
		  Case Midi.EventType.MIDI_PORT
		    Dim mpevent As Midi.Events.MidiPortEvent = Midi.Events.MidiPortEvent(EventData)
		    value = Str(mpevent.Port)
		    
		  Case Midi.EventType.SMPTE_OFFSET
		    Dim smevent As Midi.Events.SmpteOffsetEvent = Midi.Events.SmpteOffsetEvent(EventData)
		    value = Str(smevent.Hour) + ":" + Str(smevent.Minute) + ":" + Str(smevent.Second)
		    
		  Case Midi.EventType.SONG_TRACK_NAME
		    Dim stnevent As Midi.Events.SongTrackNameEvent = Midi.Events.SongTrackNameEvent(EventData)
		    value = stnevent.Text
		    
		  Case Midi.EventType.SYSEX
		    Dim sxevent As Midi.Events.SysExEvent = Midi.Events.SysExEvent(EventData)
		    value = Str(sxevent.Length)
		    
		  Case Midi.EventType.TEMPO
		    Dim tmpevent As Midi.Events.TempoEvent = Midi.Events.TempoEvent(EventData)
		    value = Str(tmpevent.BPM) + "/" + Str(tmpevent.CPM)
		    
		  Case Midi.EventType.TEXT
		    Dim txtevent As Midi.Events.TextEvent = Midi.Events.TextEvent(EventData)
		    value = txtevent.Text
		    
		  Case Midi.EventType.TIME_SIGNATURE
		    Dim tsevent As Midi.Events.TimeSignatureEvent = Midi.Events.TimeSignatureEvent(EventData)
		    value = Str(tsevent.Num) + "/" + Str(tsevent.Denum)
		    
		  Else
		    
		  End Select
		  
		  EventList.AddRow(name, time, channel, length, value, modifier)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FormatTime(Milliseconds As Int64, FractionalSeconds As Boolean = False) As String
		  ' Formats the period of time denoted by Milliseconds as HH:MM:SS. If FractionalSeconds is true then fractions of a second are included.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.FormatTime
		  
		  Dim hours As Integer = (Milliseconds / (1000 * 60 * 60))
		  Dim minutes As Integer = (Milliseconds / (1000 * 60)) Mod 60
		  Dim seconds As Integer = (Milliseconds / 1000) Mod 60
		  Dim frac As Integer  = Milliseconds Mod 1000
		  Dim out As String
		  If hours > 0 Then
		    out = Str(hours) + ":" + Format(minutes, "00") + ":"
		  Else
		    out = out + Format(minutes, "#0") + ":"
		  End If
		  If FractionalSeconds Then
		    out = out + Format(seconds + (frac / 1000), "00.00")
		  Else
		    out = out + Format(seconds, "00")
		  End If
		  Return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadEvents(Midi As Midi.EventSource)
		  Do
		    AddEventRow(Midi.CurrentEvent)
		  Loop Until Not Midi.GetNextEvent()
		  Self.Show()
		End Sub
	#tag EndMethod


#tag EndWindowCode

