.data
	matrix1:.space 1024			#������������
	matrix2:.space 1024			#��������
	return:.asciiz "\n"
	space:.asciiz " "
.text
	#��ȡ���������;���˵�����������
	li $v0, 5				#׼����ȡһ������
	syscall					#ϵͳ����
	move $s1, $v0				#��m1������$s1��
	li $v0, 5				#׼����ȡһ������
	syscall					#ϵͳ����
	move $s2, $v0				#��n1������$s2��
	li $v0, 5				#׼����ȡһ������
	syscall					#ϵͳ����
	move $s3, $v0			#��m2������$s3��
	li $v0, 5				#׼����ȡһ������
	syscall					#ϵͳ����
	move $s4, $v0			#��n2������$s4��
	
	#��ȡ���������
	li $t1, 0				#$t1=i, i=0
	for_1_begin:
		slt $t0, $t1, $s1
		beq $t0, $0, for_1_end
		li $t2, 0			#$t2=j, j=0
		for_11_begin:
			slt $t0, $t2, $s2
			beq $t0, $0, for_11_end		
		
			li $t3, 16
			mult $t1, $t3
			mflo $t3
			add $t3, $t3, $t2
			li $t4, 4
			mult $t3, $t4
			mflo $t3
			la $t0, matrix1
			add $t3, $t3, $t0
			
			li $v0, 5
			syscall
			sw $v0, 0($t3)
			
			addi $t2, $t2, 1	#j++
			j for_11_begin
			nop
		for_11_end:
		addi $t1, $t1, 1		#i++
		j for_1_begin
		nop
	for_1_end:
	
	#��ȡ�����
	li $t1, 0				#$t1=i, i=0
	for_2_begin:
		slt $t0, $t1, $s3
		beq $t0, $0, for_2_end
		li $t2, 0			#$t2=j, j=0
		for_21_begin:
			slt $t0, $t2, $s4
			beq $t0, $0, for_21_end		
		
			li $t3, 16
			mult $t1, $t3
			mflo $t3
			add $t3, $t3, $t2
			li $t4, 4
			mult $t3, $t4
			mflo $t3
			la $t0, matrix2
			add $t3, $t3, $t0
			
			li $v0, 5
			syscall
			sw $v0, 0($t3)
			
			addi $t2, $t2, 1	#j++
			j for_21_begin
			nop
		for_21_end:
		addi $t1, $t1, 1		#i++
		j for_2_begin
		nop
	for_2_end:
	
	sub $t5, $s1, $s3
	addi $t5, $t5, 1
	
	sub $t6, $s2, $s4
	addi $t6, $t6, 1
	
	li $t1, 0
	for_3_begin:
		slt $t0, $t1, $t5
		beq $t0, $0, for_3_end
		
		li $t2, 0
		for_31_begin:
			slt $t0, $t2, $t6
			beq $t0, $0, for_31_end
			
			mult $0, $0		#�� $lo �� $hi ����
			
			li $t3, 0		#k=0
			for_311_begin:
				slt $t0, $t3, $s3
				beq $t0, $0, for_311_end
				
				li $t4, 0
				for_3111_begin:
					slt $t0, $t4, $s4
					beq $t0, $0, for_3111_end
					
					#��ȡmatrix1[i + k][j + l]
					move $t7, $t1
					add $t7, $t7, $t3
					sll $t7, $t7, 4
					#li $t8, 12
					#mult $t7, $t8
					#mflo $t7
					add $t7, $t7, $t2
					add $t7, $t7, $t4
					sll $t7, $t7, 2
					#li $t8, 4
					#mult $t7, $t8
					#mflo $t7
					la $t0, matrix1
					add $t7, $t7, $t0
					lw $t7, 0($t7)
					
					#��ȡmatrix2[k][l]
					move $t8, $t3
					sll $t8, $t8, 4
					#li $t9, 12
					#mult $t8, $t9
					#mflo $t8
					add $t8 ,$t8, $t4
					sll $t8, $t8, 2
					#li $t9, 4
					#mult $t8, $t9
					#mflo $t8
					la $t0, matrix2
					add $t8, $t8, $t0	
					lw $t8, 0($t8)
					
					madd $t7, $t8
					
					addi $t4, $t4, 1
					j for_3111_begin
					nop
				for_3111_end:	
				
				#�˴�ɾȥ�˻�ȡmatrix3[i][j]�ĵ�ַ������temp			
				
				addi $t3, $t3, 1
				j for_311_begin
				nop
			for_311_end:
			
			mfhi $a0
			li $v0, 35
			syscall				
			
			mflo $a0
			li $v0, 35
			syscall
			
			la $a0, space
			li $v0, 4
			syscall				
		
			addi $t2, $t2, 1
			j for_31_begin
			nop
		for_31_end:
		
		la $a0, return
		li $v0, 4
		syscall		
		
		addi $t1, $t1, 1    
		j for_3_begin
		nop
	for_3_end:
	
	##�˴�ɾȥ�˵��ĸ�forѭ��
	
	li $v0, 10
	syscall
