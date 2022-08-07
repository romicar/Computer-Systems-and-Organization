.global	checkPrime
	
checkPrime:
							# storing n in %rdi
							# %rax is the output register
	cmpq $2, %rdi 			# compare n:2 check if n<2
	jl .L2 					# jump to L2 if n<2
	movq $2, %rcx 			# %rcx stores i #initialize i to 2
	movq %rdi, %rax 		# store n in rax
	movq $2, %r8 			# store 2 in r8
	cqto 					# convert quad to octo for division
	idivq %r8 				# n becomes n/2  #quotient stored in %rax & remainder in %rdx
	cmp %rax, %rcx 			# i:n/2 check if i<=2
	jle .L4 				# jump to L4 if i<=2
	jmp .L5 				# jump to L5 to return 1

.L4:
	movq %rdi, %rax 		# store n in %rax
	movq %rcx, %r8 			# move i to r8
	cqto 					# convert quad to octo for division
	idivq %r8 				# n/i where quotient stored in %rax and remainder in %rdx
	cmp $0, %rdx 			# check if remainder==0
	je .L2 					# jump to L2 to return 0
	incq %rcx 				# increment i
	movq %rdi, %rax 		# store n in rax
	movq $2, %r8 			# store 2 in r8
	cqto 					# convert quad to octo for division
	idivq %r8 				# n becomes n/2  #quotient stored in %rax & remainder in %rdx
	cmp %rax, %rcx			# i:n/2 check i<=2
	jle .L4 				# go back to while loop if i<=2
	jmp .L5 				# jump to L5 to return 1

.L2:
	movq $0, %rax 			# move 0 to output register
	ret 					# return

.L5:
	movq $1, %rax 			# move 1 to output register
	ret 					# return
