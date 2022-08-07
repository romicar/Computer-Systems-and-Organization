.global count
.text
count:
cmpq $0,%rdi
jle .L6
cmpq $0,%rsi       # compare diff with zero
jl .L1             # if diff<0 jump to L1
cmpq %rsi,%rdi     # compare diff with n
jl .L2             # if n < diff jump to L2
cmpq $1,%rdi       # compare 1 and n
je .L3             # if n==1 jump to L3
decq %rdi          # n=n-1
pushq %r8          # push %r8 on the stack
pushq %rdx         # push %rdx on the stack
pushq %rdi         # push %rdi on the stack
pushq %rsi         # push %rsi on the stack
call count         # call count
popq %rsi          # pop %rsi onto the stack
popq %rdi          # pop %rdi onto the stack
popq %rdx          # pop %rdx onto the stack
popq %r8           # pop %r8 onto the stack
movq %rax,%r8      # move the return value of the function to register %r8
imulq $2,%r8       # value in register %r8 gets mutiplied by 2
decq %rsi          # diff=diff-1
pushq %r8          # push %r8 on the stack
pushq %rdx         # push %rdx on the stack
pushq %rdi         # push %rdi on the stack
pushq %rsi         # push %rsi on the stack
call count         # call count
popq %rsi          # pop %rsi onto the stack
popq %rdi          # pop %rdi onto the stack
popq %rdx          # pop %rdx onto the stack
popq %r8           # pop %r8 onto the stack
movq %rax,%rdx     # move the return value of the function to register %rdx
addq $2,%rsi       # diff=diff+2
pushq %r8          # push %r8 on the stack
pushq %rdx         # push %rdx on the stack
pushq %rdi         # push %rdi on the stack
pushq %rsi         # push %rsi on the stack
call count         # call count
popq %rsi          # pop %rsi onto the stack
popq %rdi          # pop %rdi onto the stack
popq %rdx          # pop %rdx onto the stack
popq %r8           # pop %r8 onto the stack
addq %rdx,%rax     # value in %rax=value in %rax + value in %rdx
addq %r8,%rax      # value in %rax=value in %rax + value in %r8
# cqto
# movq $13,%r13      # storing 13 in %r13
# idivq %r13         
# movq %rdx,%rax     # move value of %rdx that is the ans%13 to rax
ret                # return

.L1:
imulq $-1,%rsi     # diff=-1*diff
jmp count          # unconditionally jump to count

.L2:
movq $0,%rax       # move 0 to %rax
ret                # return

.L3:
cmpq $0,%rsi      # compare 0 with diff
je .L4            # if diff==0 jump to L4
cmpq $1,%rsi      # compare 1 with diff
je .L5            # if diff==1 jump to L5
cmpq $-1,%rsi     # compare -1 with diff
je .L5            # if diff==-1 jump to L5

.L4:
movq $2,%rax      # move 2 to %rax
ret               # return

.L5:
movq $1,%rax      # move 1 to %rax
ret               # return

.L6:
movq $-1,%rax      # move -1 to %rax
ret               # return
