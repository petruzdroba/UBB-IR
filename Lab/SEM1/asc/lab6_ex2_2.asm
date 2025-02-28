bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    s db 'abcdef'
    len equ $ - s
    d times len db 0
    
; Se da un sir de caractere s.
; Se cere sirul de caractere d obtinut prin inversarea sirului s.

; our code starts here
segment code use32 class=code
    start:
        mov ecx, len
        jecxz final
        
        mov esi, s + len - 1    ; ne pozitionam in s la capatul sirului
        mov edi, d
        
        repeta:
            std     ;set direction - decrementare
            lodsb       ; pt ca DF = 1, acesta s decrmenteaza
            cld     ; acum se incrementeaza
            stosb
        loop repeta
        
        final:
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
