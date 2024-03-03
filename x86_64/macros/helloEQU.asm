;
; "equ" is used to define constants for future use.
;
; It also makes our code more readable for an "outsider".

STDIN     equ 0
STDOUT    equ 1
STDERR    equ 2

SYS_READ  equ 0
SYS_WRITE equ 1
SYS_EXIT  equ 60


section .data
  hello db "Hello EQU and constants!",10,0

section .text
  global _start

%macro exit 0
  mov rax, SYS_EXIT
  mov rdi, 0
  syscall
%endmacro


_start:
  mov rax, hello 
  call _printString
  exit

_printString:
  push rax
  mov rbx, 0
_printLoop:
  inc rax 
  inc rbx
  mov cl, [rax]
  cmp cl, 0
  jne _printLoop

  mov rax, SYS_WRITE 
  mov rdi, STDOUT
  pop rsi
  mov rdx, rbx
  syscall
  ret
