section .data

  question db "What is your name?",10
  response db "Hello "

section .bss
  userName resb 32

section .text
  global _start

_start:
  call _question
  call _readAnswer
  call _respond
  call _printName
  call _exitProgram

_question:
  mov rax, 1
  mov rdi, 1
  mov rsi, question
  mov rdx, 19
  syscall
  ret

_respond:
  mov rax, 1
  mov rdi, 1
  mov rsi, response
  mov rdx, 7
  syscall
  ret

_printName:
  mov rax, 1
  mov rdi, 1
  mov rsi, userName
  mov rdx, 32
  syscall
  ret

_readAnswer:
  mov rax, 0
  mov rdi, 0
  mov rsi, userName
  mov rdx, 32
  syscall
  ret

_exitProgram:
  mov rax, 60
  mov rdi, 0
  syscall
  ret
