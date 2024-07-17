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
        max_file_size equ            5000
                      box_string     BYTE "                       ***********************************************",13,10,"                       *                                             *",13,10,"                       *               MUSIC SYSTEM                  *",13,10,"                       *                                             *",13,10,"                       ***********************************************",13,10,10,0
                      song_array     BYTE "                                         1. Ring My Bells",0,"                                         2. Qurban",0,"                                         3. Why Not Me",0,"                                         4. IFound",0,"                                         5. ChippiChippi",0,"                                         6. MoyeMoye",0,"                                         7. BaddoBaddi",0,"                                         8. Doreamon",0,"                                         9. PocoLoco",0,0
                      filename       byte      ".\\Text\\data.txt", 0
                      file_handle    dword     0
                      count          dword 0
                      bytes_read     dword     0
                      one_string     byte      max_file_size dup(0)
                      user_input     byte       ?
                      message        byte "                                         Enter 1 for select a song ",10,"                                         Enter 2 for running loop",10,"                                         Enter 3   for Closing the Music Player",10,0
                      song_selection byte "                                         Enter the number of song you want to play",10,0
                      file1          byte ".\\Sound\\Ring.wav",0
                      file2          BYTE ".\\Sound\\Qurban.wav",0
                      file3          byte ".\\Sound\\WhyNotMe.wav",0
                      file4          BYTE ".\\Sound\\Found.wav",0
                      file5          byte ".\\Sound\\rubirabaraba.wav",0
                      file6          BYTE ".\\Sound\\MoyeMoye.wav",0
                      file7          byte ".\\Sound\\Baddo Baddi.wav",0
                      file8          byte ".\\Sound\\Doreamon.wav",0
                      file9          BYTE ".\\Sound\\PocoLoco.wav",0
                      loop_again     byte "                                         Loop Ended!",10,"                                         Press 1 if you want to replay the loop",10,"                                         Otherwise press 2",10,0
                      error          byte "                                         Wrong Input...... Enter Again.",10,0
                      GoodBye        byte "Thanks For Playing our Music Player System. Wishing to see you again.",10,"                           Bye Bye",0
                      TextFile1      byte ".\\Text\\Bell.txt",0
                      TextFile2      BYTE ".\\Text\\Qurban.txt",0
                      TextFile3      byte ".\\Text\\WhyNotMe.txt",0
                      TextFile4      BYTE ".\\Text\\Found.txt",0
                      TextFile5      byte ".\\Text\\ChippiChippi.txt",0
                      TextFile6      BYTE ".\\Text\\MoyeMoye.txt",0
                      TextFile7      byte ".\\Text\\BaddoBaddi.txt",0
                      TextFile8      byte ".\\Text\\Doreamon.txt",0
                      TextFile9      BYTE ".\\Text\\PocoLoco.txt",0
                      filename1      byte      ".\\Text\\Welcome.txt", 0
                      filename2      byte      ".\\Text\\Presented.txt", 0
                      filename3      byte      ".\\Text\\Harram.txt", 0
                      filename4      byte      ".\\Text\\Nasreen.txt", 0
                      filename5      byte      ".\\Text\\Anam.txt", 0
                      filename6      byte     ".\\Text\\ThankYou.txt", 0
                      musicfile      byte      ".\\Sound\\Intro.wav", 0



.code

FileReading PROC
                          call   OpenInputFile

                          mov    file_handle, eax

        ;    Making One-String Equals to 0
                          mov    ecx, max_file_size
                          mov    esi, 0
        L1:               
                          mov    one_string[esi],0
                          inc    esi
                          loop   L1

                          mov    eax, file_handle
                          mov    edx, OFFSET one_string
                          mov    ecx, max_file_size
                          call   ReadFromFile
     
                          mov    bytes_read, eax

                          mov    eax, file_handle
                          call   CloseFile
                          RET
FileReading Endp

Welcome PROC

    ; __________________________________________________________________
    ;____________________  Welcome Message _____________________________
             call   clrscr
                    
             mov  edx, offset filename1
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

    
    RET

Welcome ENDP

main PROC

        ;call Welcome
        
        L1:               
                          call   clrscr

                          mov    edx,offset box_string
                          call   writestring
                          mov    eax,500
                          call   delay
                          mov    esi,offset song_array
        print_loop:       
                          cmp    byte ptr [esi],0
                          je     end_loop
                          mov    edx,esi
                          call   writestring
                          mov    eax,500
                          call   delay
                          call   crlf
        next_string:      
                          inc    esi
                          cmp    byte ptr [esi],0
                          jne    next_string
                          inc    esi
                          jmp    print_loop
        end_loop:         
  
                          mov    edx,offset message
                          call   writestring
                          call   readint
                          cmp    al,1
                          je     select_song
                          cmp    al,2
                          je     song_loop
                          cmp    al, 3
                          je     Quit
                          jmp    error1
        select_song:      
                          mov    edx,OFFSET song_selection
                          call   writestring
                          call   readint
                          cmp    al,1
                          je     RingMybells
                          cmp    al,2
                          je     Qurban
                          cmp    al,3
                          je     Somebody
                          cmp    al,4
                          je     IFound
                          cmp    al,5
                          je     ChippiChippi
                          cmp    al,6
                          je     MoyeMoye
                          cmp    al,7
                          je     BaddoBaddi
                          cmp    al,8
                          je     Doreamon
                          cmp    al,9
                          je     PocoLoco
                          jmp    error2
        RingMybells:      
                          call   clrscr
                          mov    edx, offset TextFile1
                          Call   FileReading
                          mov    edx, OFFSET one_string
                          call   writestring
                          call   crlf

                          mov    esi,0
                          mov    esi, OFFSET file1
                          INVOKE PlaySound,esi, NULL, NULL
                          cmp    count, 1
                          je     Qurban
                          jmp    L1
        Qurban:           
                          call   clrscr
                          mov    edx, offset TextFile2
                          Call   FileReading
                          mov    edx, OFFSET one_string
                          call   writestring
                          call   crlf

                          mov    esi,0
                          mov    esi, OFFSET file2
                          INVOKE PlaySound,esi, NULL, NULL
                          cmp    count, 1
                          je     Somebody
                          jmp    L1
        Somebody:         
                          call   clrscr
                          mov    edx, offset TextFile3
                          Call   FileReading
                          mov    edx, OFFSET one_string
                          call   writestring
                          call   crlf

                          mov    esi, OFFSET file3
                          INVOKE PlaySound,esi, NULL, NULL
                          cmp    count, 1
                          je     IFound
                          jmp    L1
        IFound:           
                          call   clrscr
                          mov    edx, offset TextFile4
                          Call   FileReading
                          mov    edx, OFFSET one_string
                          call   writestring
                          call   crlf

                          mov    esi, OFFSET file4
                          INVOKE PlaySound,esi, NULL, NULL
                          cmp    count, 1
                          je     ChippiChippi
                          jmp    L1
        ChippiChippi:     
                          call   clrscr
                          mov    edx, offset TextFile5
                          Call   FileReading
                          mov    edx, OFFSET one_string
                          call   writestring
                          call   crlf

                          mov    esi, OFFSET file5
                          INVOKE PlaySound,esi, NULL, NULL
                          cmp    count, 1
                          je     MoyeMoye
                          jmp    L1
        MoyeMoye:         
                          call   clrscr
                          mov    edx, offset TextFile6
                          Call   FileReading
                          mov    edx, OFFSET one_string
                          call   writestring
                          call   crlf

                          mov    esi, OFFSET file6
                          INVOKE PlaySound,esi, NULL, NULL
                          cmp    count, 1
                          je     BaddoBaddi
                          jmp    L1
        BaddoBaddi:       
                          call   clrscr
                          mov    edx, offset TextFile7
                          Call   FileReading
                          mov    edx, OFFSET one_string
                          call   writestring
                          call   crlf

                          mov    esi, OFFSET file7
                          INVOKE PlaySound,esi, NULL, NULL
                          cmp    count, 1
                          je     Doreamon
                          jmp    L1
        Doreamon:         
                          call   clrscr
                          mov    edx, offset TextFile8
                          Call   FileReading
                          mov    edx, OFFSET one_string
                          call   writestring
                          call   crlf

                          mov    esi, OFFSET file8
                          INVOKE PlaySound,esi, NULL, NULL
                          cmp    count, 1
                          je     pocoLoco
                          jmp    L1
        PocoLoco:         
                          call   clrscr
                          mov    edx, offset TextFile9
                          Call   FileReading
                          mov    edx, OFFSET one_string
                          call   writestring
                          call   crlf

                          mov    esi, OFFSET file9
                          INVOKE PlaySound,esi, NULL, NULL
                          cmp    count, 1
                          je     come_back_to_loop
                          jmp    L1

        song_loop:        
                          mov    count, 1
                          jmp    RingMybells
        come_back_to_loop:
                          mov    count, 0
                          mov    edx ,offset loop_again
                          call   writestring
                          call   readint
        loop_input:       
                          cmp    al,1
                          je     song_loop
                          cmp    al,2
                          jmp    L1
                          jmp    error3

        error1:           
                          mov    edx, OFFSET error
                          call   writestring
                          jmp    L1

        error2:           
                          mov    edx, OFFSET error
                          call   writestring
                          jmp    select_song

        error3:           
                          mov    edx, OFFSET error
                          call   writestring
                          jmp    loop_input


        Quit:             
                          call   clrscr
                          mov    edx, offset filename6
                          Call   FileReading
                          mov    edx, OFFSET one_string
                          call   writestring
                          call   crlf

                          mov    esi,0
                          mov    esi, OFFSET musicfile
                          INVOKE PlaySound,esi, NULL, NULL

                          exit
main ENDP
END main