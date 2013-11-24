	.text
	.globl main

	.include "generateRandomNumber.asm"
	.include "getUserInput.asm"
	.include "convertStringToHex.asm"

main:
	jal generateRandomNumber
	jal getUserInput
	jal convertStringToHex
	
	
	

endOfProgram:
	li $v0 , 10
	syscall


#Please enter all the messages of all the files here
#Convention all messages should be grouped by file name
	.data
#getUserInput.asm
userInput: .asciiz   "\nPlease enter a positive number between 0000 and FFFF (4-DIGIT): "
userString: .space 16

#checkForBullsAndCows
winString: .asciiz "============================\n       Yeah! You win!\n============================\n\n    (__)\n    /oo\\\\________\n    \\  /          \\---\\\n     \\/        /   \\   \\\n        \\\\_|___\\\\_|/    *\n         ||    YY|\n         ||     ||\n"
thereAre: .asciiz " There are "
bullString: .asciiz " bulls.\n"
cowString: .asciiz " cows.\n"

