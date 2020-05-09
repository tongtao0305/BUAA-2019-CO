.data
	matrix1: .space 256
	matrix2: .space 256
	matrix3: .space 256
	space: .asciiz " "
	line: .asciiz "\n"
.text
main:
	li $v0, 5				# 读取整数n并且保存到$v0中
	syscall					#系统调用
	move $s0, $v0				# $s0 = n	
	la $s1, matrix1				# $s1保存第一个矩阵的首地址
	la $s2, matrix2				# $s2保存第二个矩阵的首地址
	la $s3, matrix3				# $s3保存第三个矩阵的首地址
	addi $t1, $0, 0				# $t1 = i, i = 0
	addi $t2, $0, 0 			# $t2 = j, j = 0
	addi $t3, $0, 0 			# $t3 = k, k = 0
	
	# input matrix1
	addi $t1, $0, 0				# $t1 = i, i = 0
	for_1_begin:
		slt $t0, $t1, $s0		#对循环变量i进行判断
		beq $t0, $0, for_1_end		#若i>=n则跳出循环
		
		addi $t2, $0, 0 		# $t2 = j, j = 0
		for_11_begin:
			slt $t0, $t2, $s0	#对循环变量j进行判断
			beq $t0, $0, for_11_end	#若j>=n则跳出循环
			
			move $t0, $t1
			li $t4, 8
			mult $t0, $t4
			mflo $t0
			add $t0, $t0, $t2
			li $t4, 4
			mult $t0, $t4
			mflo $t0
			add $t0, $t0, $s1
			
			li $v0, 5		# 读取整数n并且保存到$v0中
			syscall			#系统调用
			sw $v0, 0($t0)		#保存数据到第一个矩阵中
			
			addi $t2, $t2, 1	# j++
			j for_11_begin		#跳转回循环开头
		for_11_end:
	
	addi $t1, $t1, 1			# i++
	j for_1_begin				#跳转回循环开头
	for_1_end:	

	# input matrix2		
	addi $t1, $0, 0				# $t1 = i, i = 0
	for_2_begin:
		slt $t0, $t1, $s0		#对循环变量i进行判断
		beq $t0, $0, for_2_end		#若i>=n则跳出循环
		
		addi $t2, $0, 0 		# $t2 = j, j = 0
		for_21_begin:
			slt $t0, $t2, $s0	#对循环变量j进行判断
			beq $t0, $0, for_21_end	#若j>=n则跳出循环
			
			move $t0, $t1
			li $t4, 8
			mult $t0, $t4
			mflo $t0
			add $t0, $t0, $t2
			li $t4, 4
			mult $t0, $t4
			mflo $t0
			add $t0, $t0, $s2
			
			li $v0, 5		# 读取整数n并且保存到$v0中
			syscall			#系统调用
			sw $v0, 0($t0)		#保存数据到第一个矩阵中
			
			addi $t2, $t2, 1	# j++
			j for_21_begin		#跳转回循环开头
		for_21_end:
	
	addi $t1, $t1, 1			# i++
	j for_2_begin				#跳转回循环开头
	for_2_end:
	
	# calculate matrix3
	addi $t1, $0, 0				# $t1 = i, i = 0
	for_3_begin:
		slt $t0, $t1, $s0		#对循环变量i进行判断
		beq $t0, $0, for_3_end		#若i>=n则跳出循环
		
		addi $t2, $0, 0			# $t2 = j, j = 0
		for_31_begin:
			slt $t0, $t2, $s0	#对循环变量j进行判断
			beq $t0, $0, for_31_end	#若j>=n则跳出循环
		
			addi $t3, $0, 0 	# $t3 = k, k = 0		
			for_311_begin:
				slt $t0, $t3, $s0		#对循环变量k进行判断
				beq $t0, $0, for_311_end	#若k>=n则跳出循环
				
				#获取matrix1[i][k]的地址
				move $t0, $t1
				li $t4, 8
				mult $t0, $t4
				mflo $t0
				add $t0, $t0, $t3
				li $t4, 4
				mult $t0, $t4
				mflo $t0
				add $t0, $t0, $s1
				move $t5, $t0	#$t5保存matrix1[i][k]的地址
				lw $t5, 0($t5)	#$t5保存matrix1[i][k]的值
				
				#获取matrix2[k][j]的地址
				move $t0, $t3
				li $t4, 8
				mult $t0, $t4
				mflo $t0
				add $t0, $t0, $t2
				li $t4, 4
				mult $t0, $t4
				mflo $t0
				add $t0, $t0, $s2
				move $t6, $t0	#$t6保存matrix2[k][j]的地址
				lw $t6, 0($t6)	#$t6保存matrix2[k][j]的值
				
				#获取matrix3[i][j]的地址
				move $t0, $t1
				li $t4, 8
				mult $t0, $t4
				mflo $t0
				add $t0, $t0, $t2
				li $t4, 4
				mult $t0, $t4
				mflo $t0
				add $t0, $t0, $s3
				move $t7, $t0	#$t7保存matrix3[i][j]的地址
				lw $t8, 0($t7)	#$t8保存matrix3[i][j]的值
			
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
	j for_3_begin				#跳转回循环开头	
	for_3_end:
	
	
	# output matrix3
	addi $t1, $0, 0				# $t1 = i, i = 0
	for_4_begin:
		slt $t0, $t1, $s0		#对循环变量i进行判断
		beq $t0, $0, for_4_end		#若i>=n则跳出循环
		
		addi $t2, $0, 0 		# $t2 = j, j = 0
		for_41_begin:
			slt $t0, $t2, $s0	#对循环变量j进行判断
			beq $t0, $0, for_41_end	#若j>=n则跳出循环
			
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
			syscall			#系统调用
			
			li $v0, 4		
			la $a0, space
			syscall			#系统调用
			
			addi $t2, $t2, 1	# j++
			j for_41_begin		#跳转回循环开头
		for_41_end:
		
		li $v0, 4
		la $a0, line
		syscall
	
	addi $t1, $t1, 1			# i++
	j for_4_begin				#跳转回循环开头
	for_4_end:	
	
	li $v0, 10
	syscall	
