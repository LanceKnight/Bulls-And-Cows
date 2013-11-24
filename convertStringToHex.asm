	.text
	

convertStringToHex:

	li $t2 , 4096 #16 ^ 3 = 4096
	li $s1 , 0 #Initialize Number
	
 loop:
	lb $t0 , ($s0) #Break the user input string into bytes
	ble $t0 , 0x00000039, Decimal #This label to handle '0' through '9'
	ble $t0 , 0x00000046, HexUpper #This label to handle 'A' through 'F'

 Hex:
	addi $t0 , $t0 , -0x00000057 #This to handle 'a' through 'f'
	addi $s0 , $s0 , 1 #Next byte
	# Basically ABCD ==> 10 * 16 ^ 3 + 11 * 16 ^ 2 + 12 * 16 + 13 * 16 ^ 0
	mul  $t1 , $t0 , $t2
	add  $s1 , $s1 , $t1
	beq  $t2 , 1 , end
	div  $t2 , $t2 , 16
	j loop
	
	
	
 Decimal:
 
 	addi $t0 , $t0 , -0x00000030 #This to handle '0' through '9'
	addi $s0 , $s0 , 1 #Next byte
	# Basically ABCD ==> 10 * 16 ^ 3 + 11 * 16 ^ 2 + 12 * 16 + 13 * 16 ^ 0
	mul  $t1 , $t0 , $t2
	add  $s1 , $s1 , $t1
	beq  $t2 , 1 , end
	div  $t2 , $t2 , 16
	j loop

HexUpper:

	addi $t0 , $t0 , -0x00000037 #This to handle 'A' through 'F'
	addi $s0 , $s0 , 1 #Next byte
	# Basically ABCD ==> 10 * 16 ^ 3 + 11 * 16 ^ 2 + 12 * 16 + 13 * 16 ^ 0
	mul  $t1 , $t0 , $t2
	add  $s1 , $s1 , $t1
	beq  $t2 , 1 , end
	div  $t2 , $t2 , 16
	j loop
  
	
 end:
	jr $ra
	

