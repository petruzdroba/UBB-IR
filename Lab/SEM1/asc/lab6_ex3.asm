bits 32
global start

extern exit
import exit msvcrt.dll

segment data use32 class=data
    s db 12h, 13h, 15h, 18h, 22h, 25h, 27h, 30h
    len equ $ - s
    s1 times len db 0
    s2 times len db 0
    
; Se da un sir de numere intregi s.
; Se cere sa se determine sirurile de numere intregi:
; s1 - care contine doar numerele intregi pare din sirul s
; s2 - care contine doar numerele intregi impare din sirul s
segment code use32 class=code
    start:
        mov ecx, len
        jecxz final
        
        
        mov esi, 0
        
        mov edi, 0
        mov ebx, 0
        repeta:
            mov al, [s + esi]
            test al, 1
            jnz e_par
            ;e-impar
            mov [s2 + ebx], al
            inc ebx
            jmp next
            e_par:
                mov [s1 + edi], al
                inc edi
            next:
            inc esi
        loop repeta
        
        final:
        ; exit(0)
        push dword 0        ; push the parameter for exit onto the stack
        call [exit]         ; call exit to terminate the program
