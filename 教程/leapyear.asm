.data
.text
input:
	li $v0, 5			#读取年份保存在$v0中
	syscall
	move $t0, $v0			#将$v0中的年份转移到$t0中	
 
	li $t3, 100
	div $t0, $t3			#将年份除以100
	mfhi $t1			#将除以100后的余数保存在$t1中
 
	bne $t1, $0, not_divisible_by_100
		#如果能被100整除的话
		li $t3, 400
		div $t0, $t3		#将年份除以400
		mfhi $t1		#将除以400后的余数保存在$t1中
		bne $t1, $0, output_0 
			#如果能被400整除的话
			j output_1	#输出1并且结束程序

not_divisible_by_100:
	li $t3, 4
	div $t0, $t3			#将年份除以4
	mfhi $t1			#将除以4后的余数保存在$t1中
	bne $t1, $0, output_0
		#如果能被4整除的话
		j output_1	#输出1并且结束程序
 
output_0:
	li $a0, 0
	li $v0, 1
	syscall
	li $v0,10
	syscall

output_1:
	li $a0, 1
	li $v0, 1
	syscall
	li $v0,10
	syscall
