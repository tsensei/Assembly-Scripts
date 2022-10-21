#PURPOSE:	This program finds the maximum number of a
#			set of data items.
#

#VARIABLES:	The registers have following uses:
#
#			%eax - Holds the current item being examined
#			%ebx - Holds the largest item
#			%edi - Holds the current index
#

#INPUT: 	none
#

#OUTPUT:	returns the maximum value which can be
#			viewed by typing
#
#			`echo $?`
#
#			after the program ends
#

# The following memory locations are used:
#
# data_items : contains the item data. A 255 is used
#				to terminate the data
#

.section .data

data_items:
.long 3,67,34,222,45,75,54,2,34,44,33,22,11,66,255

.section .text

.globl _start
_start:

movl $0, %edi					# set 0 as current index
movl data_items(,%edi,4), %ebx	# set first item as smallest

start_loop:
movl data_items(,%edi,4), %eax
incl %edi

cmpl $255, %eax
je exit_loop

cmpl %ebx, %eax
jle start_loop

movl %eax, %ebx
jmp start_loop

exit_loop:
movl $1, %eax
int $0x80
