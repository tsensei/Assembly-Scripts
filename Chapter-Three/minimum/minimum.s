#PURPOSE:	A program to find the minimum from
#			a set of data items.
#
#INPUT:		none
#
#OUTPUT:	returns the minimum value which can be
#			viewed by typing
#
#			`echo $?`
#
#			after the program ends
#
#VARIABLES:	The following registers are used:
#
#			%eax - Stores the current value being examined
#			%ebx - Stores the minimum value found
#			%edi - Stores the current index
#
#The following memory locations are used:
#
#data_items - contains the item data. A 0 is
#			  is used to terminate the data
#

.section .data

data_items:
.long 3,67,34,222,45,75,54,2,34,44,33,22,11,66,0

.section .text

.globl _start
_start:
movl $0, %edi 						# set current index as zero
movl data_items(,%edi,4), %ebx		# set first item as smallest

start_loop:
movl data_items(,%edi,4), %eax		# set next item as current
incl %edi							# increase current index by one

cmpl $0, %eax						# checks if current item is zero
je exit_loop						# if equal, exit loop

cmpl %ebx, %eax						# compares current with minimum
jge start_loop						# if current greater or equal
									# loop again

movl %eax, %ebx						# else move current to be smallest
jmp start_loop						# loop again

exit_loop:
movl $1, %eax						# move exit command to %eax
int $0x80							# interrupts program for system call
