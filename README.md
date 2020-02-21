## Introduction
[HP MIDIFILE](http://www.heikoplate.de/hpm/) is a Windows MIDI playback and editing library. **RB-MidiFile** is a HP MIDIDFILE [binding](http://en.wikipedia.org/wiki/Language_binding) for Realbasic and Xojo ("classic" framework) projects. The minimum supported HP MIDIFILE version is 1.37. The minimum supported Xojo version is RS2010R4.

## Example
This example plays a MIDI file:
```vbnet
  Dim midfile As FolderItem = SpecialFolder.Desktop.Child("example.mid")
  Dim player As New Midi.MidiFile(midfile)
  player.Play()
  Do Until Not player.IsPlaying
    App.DoEvents()
  Loop
```
## Hilights
* Play standard MIDI files
* Select MIDI playback device†
* Read, modify, and insert MIDI events†


†= work in progress

## Synopsis
A MIDI file, whether for playing or editing, is represented by an instance of the `MidiFile` class. 

## How to incorporate HP MIDIFILE into your Realbasic/Xojo project
### Import the Midi module
1. Download the RB-MidiFile project either in [ZIP archive format](https://github.com/charonn0/RB-MidiFile/archive/master.zip) or by [cloning the repository with your Git client](x-github-client://openRepo/https://github.com/charonn0/RB-MidiFile).
2. Open the RB-MidiFile project in REALstudio or Xojo. Open your project in a separate window.
3. Copy the Midi module into your project and save.

### Ensure the HP_midifile.dll shared library is installed
HP MIDIFILE is not installed by default on most systems. You will need to copy the DLL file into the same directory as your application's EXE file.

RB-MidiFile will raise a PlatformNotSupportedException when used if all required DLLs are not available at runtime. 

