.data
.text
musBulls: add $t0, $t0, $zero
	  la $t1, 62
	  move $a0, $t1 #pitch
	  li $a1, 500 #time
	  li $a2, 32 #instrument
	  li $a3, 100 #volume
	  li $v0, 33 #beep with pause
	  syscall
	  beq $t0, 4, done #Branch out when the correct number of tones has played
	  addi $t0, $t0, 1 #Increase counter if loop must continue
	  j musBulls #Continue loop

musCows: add $t0, $t0, $zero
	 la $t1,  69
	 move $a0, $t1 #pitch
	 li $a1, 500 #time
	 li $a2, 32 #instrument
	 li $a3, 100 #volume
	 li $v0, 33 #beep with pause
	 syscall
	 beq $t0, $s5, done #Branch out when the correct number of tones has played
	 addi $t0, $t0, 1 #Increase counter if loop must continue
	 j musCows #Continue loop
	 
done: 
	jr $ra
