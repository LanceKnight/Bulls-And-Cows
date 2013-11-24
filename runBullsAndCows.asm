	.text
	.globl main

	.include "generateRandomNumber.asm"

main:
	jal generateRandomNumber
	
	
	

endOfProgram:
	li $v0 , 10
	syscall


#Please enter all the messages of all the files here
#Convention filename_msg: asciiz "\nPlease enter a sample message"
	.data

