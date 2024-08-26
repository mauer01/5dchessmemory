# Memory Manipulation Tool for 5D Chess with Multiverse Time Travel

This tool is designed to interact with the game **5D Chess with Multiverse Time Travel** by reading and modifying the game's memory addresses. It includes a graphical user interface (GUI) for various operations such as undoing moves and resuming the game.

## Features

- **Undo Move**: Allows the user to undo the last move in the game.
- **Resume Game**: Resets the game state, allowing the user to continue playing.
- **Memory Management**: Automatically handles the opening and closing of process handles.
- **Load and Monitor Game State**: Monitors if the game is running and loads necessary resources.

## Prerequisites

- **AutoIt**: This script is written in AutoIt, a scripting language designed for automating the Windows GUI and general scripting. Ensure you have [AutoIt](https://www.autoitscript.com/site/autoit/downloads/) installed.
- **AutoIt Include Files**:
  - `KDMemory.au3`: A library for memory manipulation.
  - `5dchessmemadresses.au3`: Custom include file that should define memory addresses specific to the game.
  - `ButtonConstants.au3`, `GUIConstantsEx.au3`, `WindowsConstants.au3`: Default AutoIt libraries for GUI and button management.

## Installation

1. Download the compiled exe and just start it. Requires admin privileges so it will likely ask for that.

#If you wanna compile it yourself.

1. **Download AutoIt**: Install AutoIt from the [official website](https://www.autoitscript.com/site/autoit/downloads/).

2. **Clone or Download the Script**: You can download this repository as a ZIP file and extract it, or clone it using Git.
