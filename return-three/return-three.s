#PURPOSE:	Returns the number three as status code
#		  	after program exits, which can be seen using
#		  	`echo $?`

#VARIABLES:	Following registers are used
#			%eax - Code for system call
#			%ebx - Holds return status code

.section .data

.section .text

	.globl _start
	_start:
		movl $1, %eax		# Stores 1 in register %eax
					# which is the system call for exit

		movl $3, %ebx		# Stores 3 in register %ebx
					# which gets returned as status code

		int $0x80		# interrupts program for syscall
