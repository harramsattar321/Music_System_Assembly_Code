# MASM PlaySound (PlaySoundExample.asm)

## Description
This project contains MASM Assembly code that uses the Windows PlaySound function to play `.wav` files. The music system is a simple, basic, command-line interactive application that allows users to select and play various songs.

## Features
- Display a list of songs to choose from.
- Play selected songs using the PlaySound function.
- Loop through songs or exit the music player.

## Setup Instructions

### Prerequisites
- MASM (Microsoft Macro Assembler)
- Irvine32 library (included)
- WinMM, kernel32, and user32 libraries (included)

### File Structure
- **PlaySoundExample.asm**: Main assembly code file.
- **Linked_Libraries**: Directory containing necessary libraries.
- **Sound**: Directory containing `.wav` music files.
- **Text**: Directory containing text files for displaying song information and messages.

### Instructions

1. **Clone the Repository:**
   ```bash
   git clone <repository_url>
   cd <repository_directory>
   **************************************************
*                                                *
*                 MUSIC SYSTEM                   *
*                                                *
**************************************************

1. Ring My Bells
2. Qurban
3. Why Not Me
4. IFound
5. ChippiChippi
6. MoyeMoye
7. BaddoBaddi
8. Doreamon
9. PocoLoco

Enter 1 for select a song 
Enter 2 for running loop 
Enter 3 for Closing the Music Player 

Enter the number of the song you want to play: 1
Playing: Ring My Bells
...

