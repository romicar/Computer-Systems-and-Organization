.global nextGreatest
.text
nextGreatest:
movq %rsp,%r8                # move value in %rsp to %r8 ->used for checking the state of stack
mov %rdi,%rcx                # move value of %rdi to %rcx
subq $1,%rcx                 # valur in %rcx i.e n gets decremented by 1
cmpq $0,%rcx                 # compare 0 with n-1
jge .L1                      # if n-1 >= 0 jump to L1 

.L1:
cmpq %r8,%rsp                # check if the stack is empty
jne .L2                      # if stack is not empty jump to L2
cmpq %r8,%rsp                # check if the stack is empty
je .L3                       # if stack is empty jump to L3
cmpq %r8,%rsp                # check if the stack is empty
jne .L4                      # if stack is not empty jump to L4
movq (%rsi,%rcx,8),%r9       # value in %r9= a[i]
push %r9                     # push %r9 on the stack
decq %rcx                    # value in %rcx=value in %rcx -1
cmpq $0,%rcx                 # compare value in %rcx and 0
jge .L1                      # if value in %rcx > 0 jump to L1
cmpq %rsp,%r8                # check if the stack is empty
jne .L6                      # if stack is not empty jump to L6
ret                          # return

.L2:
movq (%rsi,%rcx,8),%r10     # %r10=a[i]
movq (%rsp),%r11            # value at the top of stack is stored in %r11
cmpq %r11,%r10              # compare %r10,%r11
jge .L5                     # if a[i]>=a[peek(s)] jump to L5
cmpq %r8,%rsp               # check if the stack is empty
je .L3                      # if stack is empty jump to L3
cmpq %r8,%rsp               # check if the stack is empty
jne .L4                     # if stack is not empty jump to L4
movq (%rsi,%rcx,8),%r9      # %r9=a[i]
push %r9                    # push %r9 on the stack
decq %rcx                   # i=i-1
cmpq $0,%rcx                # compare 0 with i
jge .L1                     # if i>0 jump to L1
cmpq %rsp,%r8               # check if the stack is empty
jne .L6                     # if stack is not empty jump to L6
ret                         # return 

.L3:
movq $-1,(%rdx,%rcx,8)      # b[i]=-1
movq (%rsi,%rcx,8),%r9      # %r9=a[i]
push %r9                    # push %r9 on the stack
decq %rcx                   # i=i-1
cmpq $0,%rcx                # compare i and 0
jge .L1                     # if i>0 jump to L1
cmpq %rsp,%r8               # check if the stack is empty
jne .L6                     # if stack is not empty jump to L6
ret                         # return

.L5:
popq %r13                   # pop %r13 off the stack
cmpq %rsp,%r8               # check if the stack is empty 
jne .L2                     # if stack is not empty jump to L6
jmp .L1                     # unconditionally jump to L1

.L4:
movq (%rsp),%r11            # value at the top of stack is stored in %r11
movq %r11,(%rdx,%rcx,8)     # b[i]=value at top of stack
movq (%rsi,%rcx,8),%r9      # %r9=a[i]
push %r9                    # push %r9 on the stack
decq %rcx                   # i=i-1
cmpq $0,%rcx                # compare 0 and i
jge .L1                     # if i>0 jump to L1
cmpq %rsp,%r8               # check if the stack is empty 
jne .L6                     # if stack is not empty jump to L6
ret                         # return 
.L6:
popq %r13                   # pop %r13 off the stack
cmpq %rsp,%r8               # check if the stack is empty
jne .L6                     # if stack is not empty jump to L6
