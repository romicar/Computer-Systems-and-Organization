.global rem

rem:

    cmpq $0, %rdi               # check if m==0
	je .A                       # if equal jump to A

                                # m stored in rdi
                                # n stored in rsi
    cmpq $0, %rdi               # check m<0
    jl .L1                      # if less jmp to L1 and return -1
    cmpq $0, %rsi               # check n<0
    jle .L1                     # if less jmp to L1 and return -1
                                # store a in rcx
    movq $0, %rcx               # initialize a to 0
    movq %rdi,%r8               # store m in r8
    subq %rsi, %r8              # r8 has m-n
    cmpq %rsi, %r8              # check if m-n>=n
    jge .L2                     # while loop if m-n>=n 
    movq %r8, %rax              # move m-n to output register rax
    ret                         # return 
    
.L1:
   movq $-1, %rax               # move -1 to output register rax
   ret                          # return

.L2:                            # while loop
    incq %rcx                   # increment a in rcx
    subq %rsi, %rdi             # m = m-n
                                # again check condition for the while loop
    cmpq %rsi, %rdi             # check if m-n>=n
    jge .L2                     # jump to L2 if true
    movq %rdi, %rax             # move m-n to output register
    ret                         # return

.A:
	movq $0, %rax
	ret	
    
.global quotient
quotient:
    cmpq $0, %rdi               # check if m==0
	je .A                       # if equal jump to A
                                # m stored in rdi
                                # n stored in rsi
    cmpq $0, %rdi               # check m<0
    jl .L1                      # if less jmp to L1 and return -1
    cmpq $0, %rsi               # check n<0
    jle .L1                     # if less jmp to L1 and return -1
                                # store a in rcx
    movq $0, %rcx               # initialize a to 0
    movq %rdi,%r8               # store m in r8
    subq %rsi, %r8              # r8 has m-n
    cmpq %rsi, %r8              # check if m-n>=n
    jge .L3                     # while loop if m-n>=n
    
.L3:                            # while loop
    incq %rcx                   # increment a in rcx
    subq %rsi, %rdi             # m = m-n
                                # again check condition for the while loop
    cmpq %rsi, %rdi             # check if m-n>=n
    jge .L3                     # jump to L3 if true
    movq %rcx, %rax             # move a to output register
    ret                         # return
