.global	largest_prime

largest_prime:
							# n is stored in rdi
	testq	%rdi, %rdi  	# check if n&n == 1
	je	.Y 					# if equal jump to Y
	js	.C 					# if n&n < 0 then jump to C

.A:
	movq	$-1, %r8 		# move -1 to r8 to store max=-1
	
.B:
	testq	$1, %rdi 		# check for n&1
	jne	.D 					# if n&1 !=0
	movq	%rdi, %rax 		# move n to output register
	shrq	$31, %rax 		# right shift by 31
	addq	%rax, %rdi 		# add 
	sarq	%rdi 			# arithmetic right shift rdi
	movq	$2, %r8			# move 2 to r8
	jmp	.B					# jump to B

.C:
	negq %rdi 				# as n&n<0 negate the number to make it positive
	jmp	.A 					# jump to A

.D:
	movq	$3, %rsi		# move 3 to rsi
	jmp	.X					# move to X

.E:
	movq	%rcx, %rax		# move to output register rax
	cqto					# convert quad to octo
	idivq	%rsi			# divide n=n/2
	movq	%rax, %rdi  	# move n/2 to rdi
	movq	%rsi, %r8		# move 3 to r8
.F:
	movslq	%edi, %rcx		# extend bits for division
	movq	%rcx, %rax		# move 
	cqto					# convert quad to octo for division
	idivq	%rsi			# divide by i
	testq	%rdx, %rdx		# check i&n 
	je	.E					# jump to E if equal
	addq	$2, %rsi		# add 2 to i i=i+2

.X:
	movq	%rsi, %rdx      # move max to n
	imulq	%rsi, %rdx		# multiply n=n*2
	movslq	%edi, %rax		# extend bits from double word to quad
	cmpq	%rax, %rdx		# check if i<=2
	jle	.F					# jump to F is less than equal
	cmpq	$2, %rdi		# check if n>2
	jg	.Z					# jump to Z if greater
	movq	%r8, %rax		# move -1
	ret						# return

.Y:
	movq	$-1, %rax 		# if n&n == 1 return -1

.Z:
	ret						# return
