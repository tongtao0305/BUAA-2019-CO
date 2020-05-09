addi $4, $0, 9
ori $5, 0x7f00
addi $6, $6, 15
sw $4, 0($5)
ori $5, $0, 0x7f04
sw $6, 0($5)
ori $7, $0, 0x0c01
mtc0 $7, $12
addi $30, $30, 1 #1
addi $30, $30, 1 #2
addi $30, $30, 1 #3
addi $30, $30, 1 #4
addi $30, $30, 1 #5
addi $30, $30, 1 #6
addi $30, $30, 1 #7
ori $29, 10
addi $30, $30, 1 #8
addi $30, $30, 1 #9
sw $29, 0($0)
addi $30, $30, 1 #10
addi $30, $30, 1 #11
jal loop
addi $30, $30, 1 # IntReq #12
addi $30, $30, 1 #
loop: 
	addi $30, $30, 1 #13
	addi $30, $30, 1 #14
	addi $30, $30, 1 #15
nop
nop



.ktext 0x4180
mfc0 $10, $14
mfc0 $11, $13
srl $6, $11, 31
bne $6, $0, bd_zero
bd_zero:
addi $4, $0, 0
ori $5, $0, 0x7f00
sw $4, 0($5)
j end
nop
#bd_one:
#addi $10, $10, -4
#mtc0 $10, $14
end:
eret

