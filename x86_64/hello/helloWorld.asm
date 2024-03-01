

; Sections? 
; 
; Seemingly all x86_64 assembly files
; have three different sections,
; each one with their own purpose.
;
; The .data section is where all data
; is defined pre-compilation. Such as 
; the text variable.
; 
; The .bss section is where all data 
; is allocated for future use. Very 
; similar to the .data section, except
; for that you are opening up a space of 
; memory filled with zeros instead. Very 
; useful for reading user input.
;
; Lastly, we have the .text section; where all our code goes.
;
; Data, defining memory one can use.
; BSS, reserving memory for future use.
; Text, the actual code.



section .data
  text db "Hello World!",10
  ; db stands for define bytes.
  ; In this, we are defining a 
  ; sequence of characters that
  ; makes up "Hello World!".
  ; Whereas the 10 is a newline
  ; character, often denoted in
  ; other languages as '\n'.

  ; "text" is simply a symbolic
  ; name that points to/represents
  ; a memory location where our sequence
  ; of characters are located. In other words,
  ; it's very similar that of a variable 
  ; in any other higher level programming 
  ; languages.

  ; text db "Hello World!", 10
  ;   ^   ^   ^
  ;   |   |   |_ Defined bytes.
  ;   |   |_ Define bytes.
  ;   |_ Variable name.

section .text
  ; Global is when you want the linker to 
  ; know the address of label. The object
  ; file generated post compilation will
  ; contain a link every label declared global,
  ; such as _start below.
  global _start


;
; _start is a label. Upon compilation
; the compiler will calculate the physical
; memory location of said label. And if we 
; were to use this label later, the symbolic
; name will be replaced with the appropiate
; memory address.
;
; The _start label is essential for all programs,
; when a program is executed the operating system will
; first try to execute the _start label. And if we cannot 
; find it, our linker will throw an error.
; 
_start:
  mov rax, 1    ; Argument type.
  mov rdi, 1    ; File descriptor.
  mov rsi, text ; Buffer.
  mov rdx, 14   ; Length of string
  syscall
  ; System call arguments by register.
  ; ID - RAX 
  ;  1 - RDI 
  ;  2 - RSI 
  ;  3 - RDX 
  ;  4 - R10
  ;  5 - r8
  ;  6 - r9

  ; Some syscalls:
  ;  syscall | ID |       ARG1      |   ARG2  |  ARG3  |
  ; sys_read | 0  | #filedescriptor | $buffer | #count |
  ; sys_write| 1  | #filedescriptor | $buffer | #count |
  ; sys_open | 2  | $filename       | #flags  | #mode  |
  ; sys_close| 3  | #filedescriptor |         |        |
  ; sys_exit | 60 | #errorcode      |         |        |
  
  ; Meaning of symbols:
  ;  # = Number
  ;  $ = Memory address/Variable.

  ; In sys_write, the one we called above, we have 3 different
  ; file descriptors; 1 = Standard Input, 2 = Standard Output
  ; and 3 = Standard Error. The RDI register, in this case, is 
  ; simply put the holder of what kind of file descriptor we 
  ; will be using.


  mov rax, 60
  mov rdi, 0 ; Program exited successfully.
  syscall
