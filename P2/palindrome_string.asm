.data
	string:.space 400
.text
main:
	li $v0, 5		#��ȡһ������
	syscall			#ϵͳ����
	move $s0, $v0		#��n������$t0
	
	la $s1, string				#�����ַ����ĵ�ַ��$s1
	li $s2, 1
	
	addi $t1, $0, 0				#$t1 = i, i = 0
	for_1_begin:
		slt $t0, $t1, $s0		#��ѭ������i�����ж�
		beq $t0, $0, for_1_end		#��i>=n������ѭ��
		
		li $t2, 4
		mult $t1, $t2			
		mflo $t2
		add $t2, $t2, $s1
		
		li $v0, 12
		syscall
		sw $v0, 0($t2)
		
		addi $t1, $t1, 1		#i++
		j for_1_begin			#��ת��ѭ����ͷ
	for_1_end:
	
	addi $t1, $0, 0				#$t1 = i, i = 0
	for_2_begin:
		slt $t0, $t1, $s0		#��ѭ������i�����ж�
		beq $t0, $0, for_2_end		#��i>=n������ѭ��	
	
		#����ǰλ�ĵ�ַ��ȡ������
		li $t2, 4
		mult $t1, $t2			
		mflo $t2
		add $t2, $t2, $s1
		lw $t2, 0($t2)
				
		#�����λ�ĵ�ַ��ȡ������
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
	
	li $v0, 1		#�������
	move $a0, $s2		#������	
	syscall			#ϵͳ����
	
	li $v0, 10
	syscall
	