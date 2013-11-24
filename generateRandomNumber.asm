#Name generateRandomNumber
#This function will generate random hex number
.text

generateRandomNumber:
		li $a1 , 0x0000FFFF #Define upper bound for the number
		li $v0 , 42         #Generate Int and Store in $a0
		syscall
		move $v0 , $a0      #Return Random Number in $Vo
		jr $ra
		