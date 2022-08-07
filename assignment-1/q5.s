.global sum_square

sum_square:
						# n is stored in rdi
	cmpq $0, %rdi       # compare n and 0 ,check if n<0
	jl .X               # jump to X if n<0
	movq $0,%rax        # store 0 in %rax

.L2: 					# while loop thst runs till n>0
	movq %rdi,%rcx      # temp=n (move n to cx)
	imulq %rcx,%rcx     # temp=n*n 
	addq %rcx,%rax      # sum=sum+n*n
	cmpq $0,%rax		# if sum_square <= 0
	jl .L3 				# jump to L3
	subq $1,%rdi        # n=n-1
	cmpq $0,%rdi        # compare 0 and n
	jg .L2              # jump to L2 if n>0
	ret                 # return

.X: 					# if n<0
	movq $-1, %rax      # move -1 to the output register 
	ret                 # return

.L3:
    movq $9223372036854775807, %r12
    addq %r12,%rax
	