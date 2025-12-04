%include "in_out.asm"

SECTION .data
divu DB 'Результат: ', 0
remt DB 'Остаток от деления: ', 0

SECTION .text
GLOBAL _start

_start:
    mov eax, 4
    mov ebx, 6
    mul ebx
    add eax, 2
    xor edx, edx
    mov ebx, 5
    div ebx
    mov edi, eax
    mov eax, divu
    call sprint
    mov eax, edi
    call iprintLF
    mov eax, remt
    call sprint
    mov eax, edx
    call iprintLF
    call quit