;Anderson Pham - Section 3
;884815002


%include "setup.inc"

extern printf
extern scanf
extern getqwords

global manager

segment .data
address_msg db "The address of -7 is %lx", 10, 0
input_prompt db "Please enter an address in hex: ", 0
output_msg db "The integer at that address is %lx", 10, 0
function_msg db "Function getqword has finished. A number will be returned to the driver.", 10, 0
input_format db "%lx", 0
output_format db "%016lx", 0

number dq -7

segment .bss
user_address resq 1

segment .text
manager:
    backupgpr
    
    ;Test value print
    mov rax, 0  
    mov rdi, address_msg
    mov rsi, number
    call printf

    ;Ask for user input
    mov rax, 0  
    mov rdi, input_prompt
    call printf

    ;User input to send to getqwords
    mov rax, 0  
    mov rdi, input_format
    mov rsi, user_address
    call scanf

    mov rdi, [user_address] 
    call getqwords
    
    ;Store return in r15
    mov r15, rax

    ;Print integer at address
    mov rax, 0
    mov rdi, output_msg
    mov rsi, r15
    call printf

    ;Finished msg
    mov rax, 0  
    mov rdi, function_msg
    call printf

    mov rax, r15

    restoregpr 