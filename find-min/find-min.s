#PURPOSE :	Finding minimum from a list of numbers
#			and returning it as a status code which
#			can be seen after executing script by
#			`echo $?`


#VARIABLES:	Following registers are used
#			%eax - Holds the current value
#			%ebx - Holds the smallest value
#			%edi - Holds the current index

.section .data
	data_items:
		.long 30,20,40,4,50,90,60,70,1000	# Terminating using 1000 as
											# status code cant be greater
											# than 255

.section .text

	.globl _start
	_start:
		movl $0, %edi					# Set current index as 0
		movl data_items(,%edi,4), %eax	# load first value in %eax
		movl %eax, %ebx					# set first value to be smallest

	start_loop:
		cmpl $1000, %eax				# check if we hit end
		je exit_loop					# exit if equal

		incl %edi						# increase index by one
		movl data_items(,%edi,4), %eax	# load next value in %eax
		cmpl %eax, %ebx					# compare current with smallest
		jle start_loop					# jump to start if %ebx <= %eax

		movl %eax, %ebx					# else set current as smallest
		jmp start_loop

	exit_loop:
		movl $1, %eax					# exit code in %eax for syscall
		int $0x80						# interrupt program for syscall
