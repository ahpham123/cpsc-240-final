;Anderson Pham - Section 3
;884815002


%include "setup.inc"

global getqwords

segment .text

getqwords:
    backupgpr
    
    mov rax, [rdi]
    
    restoregpr