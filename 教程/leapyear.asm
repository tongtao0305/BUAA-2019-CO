.data
.text
input:
	li $v0, 5			#��ȡ��ݱ�����$v0��
	syscall
	move $t0, $v0			#��$v0�е����ת�Ƶ�$t0��	
 
	li $t3, 100
	div $t0, $t3			#����ݳ���100
	mfhi $t1			#������100�������������$t1��
 
	bne $t1, $0, not_divisible_by_100
		#����ܱ�100�����Ļ�
		li $t3, 400
		div $t0, $t3		#����ݳ���400
		mfhi $t1		#������400�������������$t1��
		bne $t1, $0, output_0 
			#����ܱ�400�����Ļ�
			j output_1	#���1���ҽ�������

not_divisible_by_100:
	li $t3, 4
	div $t0, $t3			#����ݳ���4
	mfhi $t1			#������4�������������$t1��
	bne $t1, $0, output_0
		#����ܱ�4�����Ļ�
		j output_1	#���1���ҽ�������
 
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
