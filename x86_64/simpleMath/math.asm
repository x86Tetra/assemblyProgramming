section .data
  digit db 0,10

section .text
  global _start

_start:
  mov rax, 6
  mov rbx, 2
  div rbx
  call _printRAXDigit

  mov rax, 1
  add rax, 4 ; rax is the subject to the addition.
  call _printRAXDigit 


  call _exitProgram

; Use case: Display a digit between 0-9 on the screen. 
_printRAXDigit:
  add rax, 48     ; The number 0 starts at 48 in the ascii standard table.
  mov [digit], al ; al only affects the first byte and not the newline character.
                  ; As well is [digit] a pointer to the memory address digit, not
                  ; a register of any kind.
  mov rax, 1
  mov rdi, 1
  mov rsi, digit
  mov rdx, 2      ; Write two bytes, one for the digit and one for the newline character.
  syscall
  ret 



_exitProgram:
  mov rax, 60
  mov rdi, 0
  syscall
  ret
