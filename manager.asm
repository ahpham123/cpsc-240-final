;Anderson Pham - Section 3
;884815002

; manager.asm
; Contains the manager function that handles user interaction and calls getqwords

%include "setup.inc"  ; Include the macro file for register backup/restore

extern printf
extern scanf
extern getqwords

global manager

segment .data
address_msg db "The address of -17 is %lx", 10, 0
input_prompt db "Please enter an address in hex: ", 0
retrieved_msg db "The integer at that address is %lx", 10, 0
function_msg db "Function getqword has finished. A number will be returned to the driver.", 10, 0
input_format db "%lx", 0

number dq -17

segment .bss
user_address resq 1

segment .text

manager:
    backupgpr
    
    ; Print the address of the number variable
    mov rax, 0
    mov rdi, address_msg
    mov rsi, number
    call printf

    ; Ask for user input
    mov rax, 0
    mov rdi, input_prompt
    call printf

    ; Get user input
    mov rax, 0
    mov rdi, input_format
    mov rsi, user_address
    call scanf

    mov rdi, [user_address]
    call getqwords
    
    mov r15, rax

    ; Display the retrieved value
    mov rax, 0
    mov rdi, retrieved_msg
    mov rsi, rax 
    call printf

    ; Message that function has finished
    mov rax, 0
    mov rdi, function_msg
    call printf

    mov rax, r15

    restoregpr