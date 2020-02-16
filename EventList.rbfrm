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
		  time = FormatTime(EventData.Time)
		  channel = Str(EventData.Channel)
		  
		  Select Case EventData
		  Case IsA Midi.Events.NoteEvent
		    Dim note As Midi.Events.NoteEvent = Midi.Events.NoteEvent(EventData)
		    length = Str(note.Length)
		    value = Str(note.Note)
		    modifier = Str(note.Velocity)
		    
		  Case IsA Midi.Events.AfterTouchEvent
		    Dim atevent As Midi.Events.AfterTouchEvent = Midi.Events.AfterTouchEvent(EventData)
		    value = Str(atevent.Note)
		    modifier = Str(atevent.Pressure)
		    
		  Case IsA Midi.Events.ControllerEvent
		    Dim ctlevent As Midi.Events.ControllerEvent = Midi.Events.ControllerEvent(EventData)
		    value = Str(ctlevent.Value)
		    modifier = Str(ctlevent.Number)
		    
		  Case IsA Midi.Events.RPNEvent
		    Dim rpnevent As Midi.Events.RPNEvent = Midi.Events.RPNEvent(EventData)
		    value = Str(rpnevent.Value)
		    modifier = Str(rpnevent.Number)
		    
		  Case IsA Midi.Events.ProgramChangeEvent
		    Dim pcevent As Midi.Events.ProgramChangeEvent = Midi.Events.ProgramChangeEvent(EventData)
		    value = Str(pcevent.Number)
		    
		  Case IsA Midi.Events.ChannelPressureEvent
		    Dim cpevent As Midi.Events.ChannelPressureEvent = Midi.Events.ChannelPressureEvent(EventData)
		    value = Str(cpevent.Pressure)
		    
		  Case IsA Midi.Events.PitchWheelEvent
		    Dim pwevent As Midi.Events.PitchWheelEvent = Midi.Events.PitchWheelEvent(EventData)
		    value = Str(pwevent.Value)
		    
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


#tag EndWindowCode

