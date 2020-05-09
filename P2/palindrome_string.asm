.data
	string:.space 400
.text
main:
	li $v0, 5		#读取一个整型
	syscall			#系统调用
	move $s0, $v0		#将n保存在$t0
	
	la $s1, string				#保存字符串的地址于$s1
	li $s2, 1
	
	addi $t1, $0, 0				#$t1 = i, i = 0
	for_1_begin:
		slt $t0, $t1, $s0		#对循环变量i进行判断
		beq $t0, $0, for_1_end		#若i>=n则跳出循环
		
		li $t2, 4
		mult $t1, $t2			
		mflo $t2
		add $t2, $t2, $s1
		
		li $v0, 12
		syscall
		sw $v0, 0($t2)
		
		addi $t1, $t1, 1		#i++
		j for_1_begin			#跳转回循环开头
	for_1_end:
	
	addi $t1, $0, 0				#$t1 = i, i = 0
	for_2_begin:
		slt $t0, $t1, $s0		#对循环变量i进行判断
		beq $t0, $0, for_2_end		#若i>=n则跳出循环	
	
		#计算前位的地址并取出数字
		li $t2, 4
		mult $t1, $t2			
		mflo $t2
		add $t2, $t2, $s1
		lw $t2, 0($t2)
				
		#计算后位的地址并取出数字
		li $t3, 4
		sub $t4, $s0, $t1
		subi $t4, $t4, 1
		mult $t3, $t4
		mflo $t3
		add $t3, $t3, $s1	
		lw $t3, 0($t3)					
		
		beq $t2, $t3, equal 
			li $s2, 0
		equal:
		
		addi $t1, $t1, 1
		j for_2_begin
	for_2_end:	
	
	li $v0, 1		#输出整型
	move $a0, $s2		#输出结果	
	syscall			#系统调用
	
	li $v0, 10
	syscall
	