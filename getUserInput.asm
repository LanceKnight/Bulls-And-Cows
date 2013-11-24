	.text
	
getUserInput:
	la $a0 , userInput #load address of userInput into $a0
	li $v0 , 4 	  #Print String
	syscall
	jr $ra