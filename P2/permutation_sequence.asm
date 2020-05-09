.data
	symbol:.space 32
	array:.space 32
	space:.asciiz " "
	return:.asciiz "\n"
	
.text
	main:
		li $v0, 5
		syscall
		move $s0, $v0			#将n保存到$s0
		la $s1, symbol
		la $s2, array	
	
		li $a1, 0
		jal permutation_sequence
	
		li $v0, 10
		syscall
	
	permutation_sequence:
		if_1_begin:
			blt $a1, $s0, if_1_end
			li $t1, 0
			for_1_begin:
				slt $t0, $t1, $s0
				beq $t0, $0, for_1_end
				
				li $t2, 4
				mult $t1, $t2
				mflo $t2
				add $t2, $t2, $s2
				lw $t2, 0($t2)
					
				move $a0, $t2
				li $v0, 1
				syscall
					
				la $a0, space
				li $v0, 4
				syscall
				
				addi $t1, $t1, 1
				j for_1_begin
			for_1_end:
			
			la $a0, return
			li $v0, 4
			syscall
			
			jr $ra						
		if_1_end:
		
		li $t1, 0
		for_2_begin:
			slt $t0, $t1, $s0
			beq $t0, $0, for_2_end
		
			if_2_begin:
				li $t2, 4
				mult $t1, $t2
				mflo $t2
				add $t2, $t2, $s1	#symbol[i]的地址
			
				lw $t3, 0($t2)		#symbol[i]
				bne $t3, $0 ,if_2_end
				#array[index]=i+1
				move $t3, $a1
				li $t4, 4
				mult $t3, $t4
				mflo $t3
				add $t3, $t3, $s2
				move $t4, $t1
				addi $t4, $t4, 1
				sw $t4, 0($t3)
				 
				#symbol[i]=1
				li $t3, 1
				sw $t3, 0($t2) 	
				
				#FullArray(index+1)
				addi $sp, $sp, -16
				sw $a1, 0($sp)
				sw $ra, 4($sp)
				sw $t1, 8($sp)
				sw $t2, 12($sp)
				addi $a1, $a1, 1 
				jal permutation_sequence
				
				lw $t2, 12($sp)
				lw $t1, 8($sp)
				lw $ra, 4($sp)
				lw $a1, 0($sp)
				addi $sp, $sp, 16
								
				#symbol[i]=0
				sw $0, 0($t2) 							
			if_2_end:	
			addi $t1, $t1, 1
			j for_2_begin	
		for_2_end:
		jr $ra	
		nop	
