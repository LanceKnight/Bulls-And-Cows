	.text
	.globl main

	.include "generateRandomNumber.asm"

main:
	jal generateRandomNumber
	
	
	

endOfProgram:
	li $v0 , 10
	syscall

