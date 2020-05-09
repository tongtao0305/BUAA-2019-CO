.data
	matrix1: .space 256
	matrix2: .space 256
	matrix3: .space 256
	space: .asciiz " "
	line: .asciiz "\n"
.text
main:
	li $v0, 5				# ��ȡ����n���ұ��浽$v0��
	syscall					#ϵͳ����
	move $s0, $v0				# $s0 = n	
	la $s1, matrix1				# $s1�����һ��������׵�ַ
	la $s2, matrix2				# $s2����ڶ���������׵�ַ
	la $s3, matrix3				# $s3���������������׵�ַ
	addi $t1, $0, 0				# $t1 = i, i = 0
	addi $t2, $0, 0 			# $t2 = j, j = 0
	addi $t3, $0, 0 			# $t3 = k, k = 0
	
	# input matrix1
	addi $t1, $0, 0				# $t1 = i, i = 0
	for_1_begin:
		slt $t0, $t1, $s0		#��ѭ������i�����ж�
		beq $t0, $0, for_1_end		#��i>=n������ѭ��
		
		addi $t2, $0, 0 		# $t2 = j, j = 0
		for_11_begin:
			slt $t0, $t2, $s0	#��ѭ������j�����ж�
			beq $t0, $0, for_11_end	#��j>=n������ѭ��
			
			move $t0, $t1
			li $t4, 8
			mult $t0, $t4
			mflo $t0
			add $t0, $t0, $t2
			li $t4, 4
			mult $t0, $t4
			mflo $t0
			add $t0, $t0, $s1
			
			li $v0, 5		# ��ȡ����n���ұ��浽$v0��
			syscall			#ϵͳ����
			sw $v0, 0($t0)		#�������ݵ���һ��������
			
			addi $t2, $t2, 1	# j++
			j for_11_begin		#��ת��ѭ����ͷ
		for_11_end:
	
	addi $t1, $t1, 1			# i++
	j for_1_begin				#��ת��ѭ����ͷ
	for_1_end:	

	# input matrix2		
	addi $t1, $0, 0				# $t1 = i, i = 0
	for_2_begin:
		slt $t0, $t1, $s0		#��ѭ������i�����ж�
		beq $t0, $0, for_2_end		#��i>=n������ѭ��
		
		addi $t2, $0, 0 		# $t2 = j, j = 0
		for_21_begin:
			slt $t0, $t2, $s0	#��ѭ������j�����ж�
			beq $t0, $0, for_21_end	#��j>=n������ѭ��
			
			move $t0, $t1
			li $t4, 8
			mult $t0, $t4
			mflo $t0
			add $t0, $t0, $t2
			li $t4, 4
			mult $t0, $t4
			mflo $t0
			add $t0, $t0, $s2
			
			li $v0, 5		# ��ȡ����n���ұ��浽$v0��
			syscall			#ϵͳ����
			sw $v0, 0($t0)		#�������ݵ���һ��������
			
			addi $t2, $t2, 1	# j++
			j for_21_begin		#��ת��ѭ����ͷ
		for_21_end:
	
	addi $t1, $t1, 1			# i++
	j for_2_begin				#��ת��ѭ����ͷ
	for_2_end:
	
	# calculate matrix3
	addi $t1, $0, 0				# $t1 = i, i = 0
	for_3_begin:
		slt $t0, $t1, $s0		#��ѭ������i�����ж�
		beq $t0, $0, for_3_end		#��i>=n������ѭ��
		
		addi $t2, $0, 0			# $t2 = j, j = 0
		for_31_begin:
			slt $t0, $t2, $s0	#��ѭ������j�����ж�
			beq $t0, $0, for_31_end	#��j>=n������ѭ��
		
			addi $t3, $0, 0 	# $t3 = k, k = 0		
			for_311_begin:
				slt $t0, $t3, $s0		#��ѭ������k�����ж�
				beq $t0, $0, for_311_end	#��k>=n������ѭ��
				
				#��ȡmatrix1[i][k]�ĵ�ַ
				move $t0, $t1
				li $t4, 8
				mult $t0, $t4
				mflo $t0
				add $t0, $t0, $t3
				li $t4, 4
				mult $t0, $t4
				mflo $t0
				add $t0, $t0, $s1
				move $t5, $t0	#$t5����matrix1[i][k]�ĵ�ַ
				lw $t5, 0($t5)	#$t5����matrix1[i][k]��ֵ
				
				#��ȡmatrix2[k][j]�ĵ�ַ
				move $t0, $t3
				li $t4, 8
				mult $t0, $t4
				mflo $t0
				add $t0, $t0, $t2
				li $t4, 4
				mult $t0, $t4
				mflo $t0
				add $t0, $t0, $s2
				move $t6, $t0	#$t6����matrix2[k][j]�ĵ�ַ
				lw $t6, 0($t6)	#$t6����matrix2[k][j]��ֵ
				
				#��ȡmatrix3[i][j]�ĵ�ַ
				move $t0, $t1
				li $t4, 8
				mult $t0, $t4
				mflo $t0
				add $t0, $t0, $t2
				li $t4, 4
				mult $t0, $t4
				mflo $t0
				add $t0, $t0, $s3
				move $t7, $t0	#$t7����matrix3[i][j]�ĵ�ַ
				lw $t8, 0($t7)	#$t8����matrix3[i][j]��ֵ
			
				mult $t5, $t6
				mflo $t9
				add $t8, $t8, $t9
				sw $t8, 0($t7)
			
			addi $t3, $t3, 1
			j for_311_begin
			for_311_end:
		
		addi $t2, $t2, 1
		j for_31_begin
		for_31_end:
				
	addi $t1, $t1, 1			# i++
	j for_3_begin				#��ת��ѭ����ͷ	
	for_3_end:
	
	
	# output matrix3
	addi $t1, $0, 0				# $t1 = i, i = 0
	for_4_begin:
		slt $t0, $t1, $s0		#��ѭ������i�����ж�
		beq $t0, $0, for_4_end		#��i>=n������ѭ��
		
		addi $t2, $0, 0 		# $t2 = j, j = 0
		for_41_begin:
			slt $t0, $t2, $s0	#��ѭ������j�����ж�
			beq $t0, $0, for_41_end	#��j>=n������ѭ��
			
			move $t0, $t1
			li $t4, 8
			mult $t0, $t4
			mflo $t0
			add $t0, $t0, $t2
			li $t4, 4
			mult $t0, $t4
			mflo $t0
			add $t0, $t0, $s3
			lw $t0, 0($t0)
			
			li $v0, 1		
			move $a0, $t0
			syscall			#ϵͳ����
			
			li $v0, 4		
			la $a0, space
			syscall			#ϵͳ����
			
			addi $t2, $t2, 1	# j++
			j for_41_begin		#��ת��ѭ����ͷ
		for_41_end:
		
		li $v0, 4
		la $a0, line
		syscall
	
	addi $t1, $t1, 1			# i++
	j for_4_begin				#��ת��ѭ����ͷ
	for_4_end:	
	
	li $v0, 10
	syscall	
