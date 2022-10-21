#PURPOSE:	A program that exits and returns
#			a status code to kernel
#

#INPUT:		none
#

#OUTPUT:	returns a status code. This can be
#			viewed by typing
#
#			`echo $?`
#
#			after running the program
#

#VARIABLES:	
#			%eax holds the system call number
#			%ebx holds the return status code
#
.section .data

.section .text
	.globl _start
	_start:
		movl $1, %eax		# This is the linux kernel command for
							# exiting the program

		movl $3, %ebx		# This is what gets returned to kernel
							# as exit status code

		int $0x80			# Interrupts the program and waits for kernel
							# to make a system call
