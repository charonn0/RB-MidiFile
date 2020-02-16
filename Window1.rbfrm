#tag Window
Begin Window Window1
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   2.86e+2
   ImplicitInstance=   True
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
   Placement       =   2
   Resizeable      =   False
   Title           =   "HP MidiFile Demo"
   Visible         =   True
   Width           =   6.61e+2
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      Left            =   1007
      LockedInPosition=   False
      Mode            =   0
      Period          =   100
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   157
      Width           =   32
   End
   Begin Slider Slider1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   152
      LineStep        =   1
      LiveScroll      =   False
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   1
      Top             =   48
      Value           =   0
      Visible         =   True
      Width           =   356
   End
   Begin Slider Slider2
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   408
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   400
      Minimum         =   10
      PageStep        =   20
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   21
      Value           =   100
      Visible         =   True
      Width           =   100
   End
   Begin PushButton LoadBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Load"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   152
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PlayBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Play"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   234
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton StopBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Stop"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   316
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Label TimeLabel
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   284
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   "00:00:00/00:00:00"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   83
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   92
   End
   Begin Timer TimeTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   1007
      LockedInPosition=   False
      Mode            =   0
      Period          =   1
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   201
      Width           =   32
   End
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
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   1
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   115
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   641
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  If Midi.IsAvailable Then
		    Me.Title = Midi.Version + " demo"
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddEventRow(EventData As Midi.Events.MidiEvent)
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


	#tag Property, Flags = &h1
		Protected mFractionalSeconds As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		player As Midi.Player
	#tag EndProperty

	#tag Property, Flags = &h21
		Private UILock As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  If UILock Then Return
		  If Not player.IsPlaying Then
		    Me.Mode = Timer.ModeOff
		    TimeTimer.Mode = Timer.ModeOff
		    PlayBtn.Caption = "Play"
		    StopBtn.Enabled = False
		    Return
		  End If
		  Dim total As Int32 = player.Duration
		  Dim now As Integer = player.PlayTime
		  UILock = True
		  Slider1.Value = now * 100 / total
		  UILock = False
		  If TimeTimer.Mode <> Timer.ModeMultiple Then TimeTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  If UILock Then Return
		  UILock = True
		  player.EventTime = Me.Value * player.Duration / Me.Maximum
		  UILock = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Slider2
	#tag Event
		Sub ValueChanged()
		  player.Tempo = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadBtn
	#tag Event
		Sub Action()
		  Dim f As FolderItem = GetOpenFolderItem(FileTypes1.All)
		  If f = Nil Or Not f.Exists Then Return
		  player = New Midi.Player(f)
		  Dim evntsrc As New Midi.EventSource
		  evntsrc.Load(f)
		  EventList.DeleteAllRows
		  
		  Do
		    AddEventRow(evntsrc.CurrentEvent)
		  Loop Until not evntsrc.GetNextEvent()
		  PlayBtn.Enabled = True
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlayBtn
	#tag Event
		Sub Action()
		  Select Case Me.Caption
		  Case "Play"
		    player.Play()
		    Me.Caption = "Pause"
		    
		  Case "Pause"
		    player.Pause()
		    Me.Caption = "Resume"
		    
		  Case "Resume"
		    player.Resume()
		    Me.Caption = "Pause"
		    
		  End Select
		  
		  StopBtn.Enabled = True
		  Slider2.Value = player.Tempo
		  Timer1.Mode = Timer.ModeMultiple
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopBtn
	#tag Event
		Sub Action()
		  player.Stop
		  PlayBtn.Caption = "Play"
		  Me.Enabled = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TimeLabel
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Dim r As New REALbasic.Rect(0, 0, Me.Width, Me.Height)
		  Dim p As New REALbasic.Point(X, Y)
		  If r.Contains(p) Then
		    mFractionalSeconds = Not mFractionalSeconds
		    Self.Refresh(False)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TimeTimer
	#tag Event
		Sub Action()
		  If UILock Then Return
		  TimeLabel.Text = FormatTime(Player.PlayTime, mFractionalSeconds) + "/" + FormatTime(Player.Duration, mFractionalSeconds)
		End Sub
	#tag EndEvent
#tag EndEvents
