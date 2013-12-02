	.text
	.globl main

	.include "generateRandomNumber.asm"
	.include "getUserInput.asm"
	.include "convertStringToHex.asm"
	.include "checkForBullsAndCows.asm"
	.include "sameNumberValidation.asm"
	

main:
	li  $s7 , 100 #Maximum score is 100 To-Do
	jal generateRandomNumber #Random number get stored in $v0
	
	move $s0 , $v0           #Move number to $s0
	
	
getInput:
        beq $s7 , 0 , 	endOfProgram
        addi $s7 , $s7 , -20 #To-Do 
        jal getUserInput         #User input as a string is in $a0
	
	jal convertStringToHex   #Converted string is in $v1
	
	beq $v0 , 0 , getInput
	
	move $s1 , $v1
	
	move $a0 , $v1           #Move the content of $v1 to $a0 for number validation
	
	jal sameNumberValidation
	
	beq $v0 , 0 , getInput
	
	#Pass $s0 computer generated number and $s1 user generated number
	#call checkforbulls and cows
	#jal checkForBullsAndCows
	
	
	

endOfProgram:
	li $v0 , 10
	syscall


#Please enter all the messages of all the files here
#Convention all messages should be grouped by file name
	.data
#getUserInput.asm
userInput: .asciiz   "\nPlease enter a positive number between 0000 and FFFF (4-DIGIT): "
userString: .space 16 #Allocate 4 bytes for user input

#checkForBullsAndCows
winString: .asciiz "============================\n       Yeah! You win!\n============================\n\n    (__)\n    /oo\\\\________\n    \\  /          \\---\\\n     \\/        /   \\   \\\n        \\\\_|___\\\\_|/    *\n         ||    YY|\n         ||     ||\n"
thereAre: .asciiz " There are "
bullString: .asciiz " bulls.\n"
cowString: .asciiz " cows.\n"

#convertStringToHex
notInRange: .asciiz "\nError ==> The input is not in range Please enter a hex number between 0 and F.\n"

#sameNumberValidation
repetetiveNumberMsg: .asciiz "\nError ==> The input is should be distinct Please enter a distinct number between 0 and F.\n"
