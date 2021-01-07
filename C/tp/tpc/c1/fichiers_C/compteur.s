.global _start
.text

_start:
    xor %rax, %rax
loop: cmp $9, %rax
    jge end_loop
    inc %rax
    jmp loop
end_loop: 


xor %rdi, %rdi
mov $60, %rax
syscall


.data
reponse: .ascii "A\n"
