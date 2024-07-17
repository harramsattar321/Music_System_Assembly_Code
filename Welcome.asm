TITLE MASM PlaySound (PlaySoundExample.asm)

; Description: MASM Assembly code that uses the Windows PlaySound function to play .wav files

INCLUDE Irvine32.inc

includelib .\\Linked_Libraries\\WinMM.lib
includelib .\\Linked_Libraries\\kernel32.lib
includelib .\\Linked_Libraries\\user32.lib
INCLUDE macros.inc

PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD


.data
    max_file_size equ         8000
                  filename1   byte      ".\\Text\\Welcome.txt", 0
                  filename2   byte      ".\\Text\\Presented.txt", 0
                  filename3   byte      ".\\Text\\Harram.txt", 0
                  filename4   byte      ".\\Text\\Nasreen.txt", 0
                  filename5   byte      ".\\Text\\Anam.txt", 0
                  filename6   byte      ".\\Text\\BrokenHeart.txt", 0
                  SpaceFile   byte      ".\\Text\\spaces.txt", 0
                  musicfile   byte      ".\\Sound\\Intro.wav", 0
                  file_handle dword     0
                  bytes_read  dword     0
                  one_string  byte      max_file_size dup(0)

.code

FileReading PROC
             call OpenInputFile

             mov  file_handle, eax

        ;    Making One-String Equals to 0  
             mov ecx, max_file_size
             mov esi, 0
             L1:
                mov one_string[esi],0
                inc esi
             loop L1

             mov  eax, file_handle
             mov  edx, OFFSET one_string
             mov  ecx, max_file_size
             call ReadFromFile
     
             mov  bytes_read, eax

             mov  eax, file_handle
             call CloseFile
             RET
FileReading Endp

main PROC

    ; __________________________________________________________________
    ;____________________  Welcome Message _____________________________
             call   clrscr
                    
             mov  edx, offset filename6
             Call FileReading

             mov  edx, OFFSET one_string
             call writestring
             call crlf
    
            ; Playing Intro Music
            mov    esi,0
            mov    esi, OFFSET musicfile
            INVOKE PlaySound,esi, NULL, NULL
    ;______________________________________________________________________


    ; __________________________________________________________________
    ;____________________  Presenting Message __________________________
             call   clrscr
                    
             mov  edx, offset filename2
             Call FileReading

             mov  edx, OFFSET one_string
             call writestring
             call crlf

             ; Playing Intro Music
            mov    esi,0
            mov    esi, OFFSET musicfile
            INVOKE PlaySound,esi, NULL, NULL
    ;______________________________________________________________________

    ; __________________________________________________________________
    ;____________________  Printing Harram   _____________________________
             call   clrscr
                    
             mov  edx, offset filename3
             Call FileReading

             mov  edx, OFFSET one_string
             call writestring
             call crlf

             ; Playing Intro Music
            mov    esi,0
            mov    esi, OFFSET musicfile
            INVOKE PlaySound,esi, NULL, NULL
    ;______________________________________________________________________

    ; __________________________________________________________________
    ;____________________  Printing Nasreen  ___________________________
             call   clrscr
                    
             mov  edx, offset filename4
             Call FileReading

             mov  edx, OFFSET one_string
             call writestring
             call crlf

             ; Playing Intro Music
            mov    esi,0
            mov    esi, OFFSET musicfile
            INVOKE PlaySound,esi, NULL, NULL
    ;______________________________________________________________________

    ; __________________________________________________________________
    ;____________________  Printing Anam   _____________________________
             call   clrscr
                    
             mov  edx, offset filename5
             Call FileReading

             mov  edx, OFFSET one_string
             call writestring
             call crlf

             ; Playing Intro Music
            mov    esi,0
            mov    esi, OFFSET musicfile
            INVOKE PlaySound,esi, NULL, NULL
    ;______________________________________________________________________

             exit
main ENDP
END main