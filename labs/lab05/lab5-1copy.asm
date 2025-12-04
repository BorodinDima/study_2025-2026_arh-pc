SECTION .data
msg: DB 'Введите строку:', 10
msgLen: EQU $ - msg

SECTION .bss
buf1: RESB 80

SECTION .text

GLOBAL _start

_start:
    ; Вывод приглашения
    mov    eax, 4        ; sys_write
    mov    ebx, 1        ; stdout
    mov    ecx, msg      ; указатель на строку
    mov    edx, msgLen   ; длина строки
    int    80h
    
    ; Чтение строки
    mov    eax, 3        ; sys_read
    mov    ebx, 0        ; stdin
    mov    ecx, buf1     ; буфер для ввода
    mov    edx, 80       ; размер буфера
    int    80h
    
    ; Сохраняем количество прочитанных байт (возвращается в eax)
    mov    esi, eax      ; сохраняем длину введенной строки
    
    ; Вывод введенной строки
    mov    eax, 4        ; sys_write
    mov    ebx, 1        ; stdout
    mov    ecx, buf1     ; буфер с введенной строкой
    mov    edx, esi      ; длина введенной строки
    int    80h
    
    ; Завершение программы
    mov    eax, 1        ; sys_exit
    mov    ebx, 0        ; код возврата
    int    80h