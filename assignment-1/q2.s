.global gcd

gcd: 
                                    # gcd(rdi,rsi)
                                    # rdi stores a
                                    # rsi stores b 
    cmpq $0, %rdi                   # check if a<0
    jl .L2                          # jump to L2 if a<0
    cmpq $0, %rsi                   # check if b<0
    jl .L3                          # jump to L2 if b<0
    cmpq $0, %rsi                   # check if b==0
    je .L4                          # jump to L4 if b==0
    movq %rdi,%rax                  # move a to rax
    cqto                            # convert quad to octo for division
    idivq %rsi                      # divide by b
    movq %rsi, %rdi                 # mov b to rdi
    movq %rdx, %rsi                 # store the remainder of a/b in rsi which is a%b
    call gcd                        # recursively call gcd for (b,a%b)
    ret                             # return

.L2:
    imulq $-1,%rdi                  # multiply a*(-1) => a=a*(-1)
    jmp gcd                         # jump to function gcd

.L3:
    imulq $-1,%rsi                  # multiply b*(-1) => b=b*(-1) 
    jmp gcd                         # jump to function gcd

.L4:
    movq %rdi, %rax                 # move a to output register
    ret                             # return
