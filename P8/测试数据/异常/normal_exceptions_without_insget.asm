# get num exceptions--4
ori $6, 10
ori $5, $0, 0x0088
lw $6, 1($5)
ori $5, $0, 0x7f0c
lw $6, 0($5)
ori $5, $0, 0x7f10
lh $6, 0($5)

# store num exceptions--5
ori $6, $0, 0x0088
sw $5, 1($6)
ori $6, $0, 0x2fff
sw $5, 0($6)
ori $6, $0, 0x7f08
sw $5, 0($6)
ori $6, $0, 0x7f08
sh $5, 0($6)

# overflow exceptions--12
lui $5, 0x7fff
add $5, $5, $5
ori $5, $0, 0x7fffffff
addi $6, $5, 1
lui $7, 0x800
ori $6, $0, 0x7fffffff
sub $5, $7, $6
ori $5, $0, 0x7fffffff
sw $5, 1($5)
ori $5, $0, 0x7fffffff
lw $6, 1($5) 

# get Addr exceptions--4
#ori $5, $0, 0x3094
#jalr $6, $5

# unrecognized instruction exceptions--10
#msub $5, $6


stop:
	j stop
	nop
	
.ktext 0x4180
mfc0 $10, $14
addi $10, $10, 4
mtc0 $10, $14
mfc0 $11, $13
addi $12, $12, 4
sw $11, 0($12)
eret
