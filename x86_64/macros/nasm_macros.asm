section .data
  digit db 0,10 

section .text
  global _start

;
; A macro is a single instruction that
; expands into a predefined set of 
; instructions to perform a particular task.
;
; The macro "exit" would for example be converted
; into the sys_exit call post-compilation:
; mov rax, 60
; mov rdi, 0
; syscall
;
;
; To define this exit macro, we would use the following syntax:
%macro exit 0 ; The zero is argc, how many arguments the macro
  mov rax, 60 ; will take. These arguments are inputs that could
  mov rdi, 0  ; be passed into the macro. These inputs are referenced
  syscall     ; within the macro by using %1, %2, %3 and etc.
%endmacro

%macro printDigit 1
  mov rax, %1
  call _printRAXDigit
%endmacro

%macro printSum 2
  mov rax, %1
  add rax, %2
  call _printRAXDigit 
%endmacro 

_start:
  printDigit 1
  printSum 3, 4
  exit


_printRAXDigit:
  add rax, 48
  mov [digit], al
  mov rax, 1
  mov rdi, 1
  mov rsi, digit
  mov rdx, 2
  syscall
  ret
  
