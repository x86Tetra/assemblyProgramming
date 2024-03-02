section .data
  text db "Hello From Subroutine Print!",10,0
  info db "This programme can take a string of any length and print",10,"it appropriately. You don't need to specifiy the length in rdx!",10,0

section .text
  global _start

_start:
  mov rax, text
  call _print 

  mov rax, info
  call _print

  call _exitProgram

_print:
  push rax      ; Push the string data onto the stack
  mov rbx, 0    ; Use RBX to calculate the length of the string.

_printLoop:
  inc rax       ; Incrementing RAX will make our program 
                ; point to the next byte in our sequence.
                ; Everytime we enter this loop, we will be holding
                ; the next value in the string.
  inc rbx       ; Increment RBX 
  mov cl, [rax] ; Move the value of RAX's pointing value to the 8-bit
                ; register variant of RCX.
  cmp cl, 0     ; Compare cl with 0.
  jne _printLoop; If cl is not equal to 0, continue the loop.
                ; Otherwise, print the string out.
  mov rax, 1
  mov rdi, 1
  pop rsi       ; Pop the string data from the stack into RSI.
  mov rdx, rbx  ; Use the length of our string as the argument.
  syscall       ; Invoke the sys_write call.
  ret
  
_exitProgram:
  mov rax, 60
  mov rdi, 0
  syscall
