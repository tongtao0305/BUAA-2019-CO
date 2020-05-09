.text 0x3000
init:
	li $s0, 0xfc01
	mtc0 $s0, $12
    addu $27,$0,$0
    addu $28,$0,$0
    addu $29,$0,$0
    addu $30,$0,$0
    addu $31,$0,$0
    lui $10, 0xffff
    ori $10, $10, 0xffff
    ori $28,$28,4
    addu $29, $29, $28
init_end:
    j init_end
    nop

block_0:
    addi $27, $27, 1
    lui $15,0x0000
    ori $15,$15,0x2a71
    lui $24,0x0000
    ori $24,$24,0x5d3b
    lui $23,0x0000
    ori $23,$23,0x4133
    lui $24,0x0000
    ori $24,$24,0x399d
    subu $23,$15,$24
    and $3,$23,$24
    sw $3, 0($29)
    addu $29,$29,$28
    j block_1
    ori $30,$0,16
    
block_1:
    lui $15,0xffff
    ori $15,$15,0x899e
    lui $24,0xffff
    ori $24,$24,0xb188
    lui $23,0x0000
    ori $23,$23,0x63a3
    lui $24,0x0000
    ori $24,$24,0x59af
    subu $23,$15,$24
    nop
    and $3,$23,$24
    sw $3,0($29)
    addu $29,$29,$28
    j block_2
    nop
    
block_2:
    lui $15,0xffff
    ori $15,$15,0x8fc6
    lui $24,0xffff
    ori $24,$24,0xa538
    lui $23,0x0000
    ori $23,$23,0x2d83
    lui $24,0x0000
    ori $24,$24,0x224b
    subu $23,$15,$24
    nop
    ori $30,$0,54
    and $3,$23,$24
    sw $3,0($29)
    addu $29,$29,$28
    j block_3
    ori $30,$0,48
    
block_3:
    lui $16,0x0000
    ori $16,$16,0x3442
    lui $25,0x0000
    ori $25,$25,0x0434
    lui $0,0x0000
    ori $0,$0,0x369e
    lui $25,0x0000
    ori $25,$25,0x1d13
    subu $0,$16,$25
    and $17,$0,$25
    sw $17,0($29)
    addu $29,$29,$28
    j block_4
    nop
    
block_4:
    lui $16,0x0000
    ori $16,$16,0x1c52
    lui $25,0xffff
    ori $25,$25,0xe91b
    lui $0,0x0000
    ori $0,$0,0x1aef
    lui $25,0xffff
    ori $25,$25,0x8ccf
    subu $0,$16,$25
    ori $30,$0,43
    and $17,$0,$25
    sw $17,0($29)
    addu $29,$29,$28
    j block_5
    nop
    
block_5:
    lui $16,0x0000
    ori $16,$16,0x2fe7
    lui $25,0xffff
    ori $25,$25,0xc791
    lui $0,0x0000
    ori $0,$0,0x2a19
    lui $25,0xffff
    ori $25,$25,0xf242
    subu $0,$16,$25
    nop
    ori $30,$0,95
    and $17,$0,$25
    sw $17,0($29)
    addu $29,$29,$28
    j block_6
    nop
    
block_6:
    lui $2,0x0000
    ori $2,$2,0x760f
    lui $22,0xffff
    ori $22,$22,0xb990
    lui $15,0xffff
    ori $15,$15,0x9524
    lui $22,0xffff
    ori $22,$22,0xd79b
    subu $1,$2,$22
    and $16,$15,$22
    sw $1,0($29)
    addu $29,$29,$28
    sw $16,0($29)
    addu $29,$29,$28
    j block_7
    ori $30,$0,32
    
block_7:
    lui $2,0xffff
    ori $2,$2,0xd18e
    lui $22,0x0000
    ori $22,$22,0x3e24
    lui $15,0x0000
    ori $15,$15,0x2357
    lui $22,0x0000
    ori $22,$22,0x64d4
    subu $1,$2,$22
    ori $30,$0,96
    and $16,$15,$22
    sw $1,0($29)
    addu $29,$29,$28
    sw $16,0($29)
    addu $29,$29,$28
    j block_8
    ori $30,$0,32
    
block_8:
    lui $2,0x0000
    ori $2,$2,0x0376
    lui $22,0xffff
    ori $22,$22,0xf1e1
    lui $15,0xffff
    ori $15,$15,0x996c
    lui $22,0x0000
    ori $22,$22,0x141b
    subu $1,$2,$22
    ori $30,$0,66
    ori $30,$0,5
    and $16,$15,$22
    sw $16,0($29)
    addu $29,$29,$28
    j block_9
    nop
    
block_9:
    lui $8,0xffff
    ori $8,$8,0x82fe
    lui $24,0x0000
    ori $24,$24,0x289a
    lui $26,0xffff
    ori $26,$26,0x9514
    lui $24,0xffff
    ori $24,$24,0xc9ff
    subu $0,$8,$24
    and $17,$26,$24
    sw $17,0($29)
    addu $29,$29,$28
    j block_10
    ori $30,$0,51
    
block_10:
    lui $8,0xffff
    ori $8,$8,0x90cc
    lui $24,0x0000
    ori $24,$24,0x4762
    lui $26,0xffff
    ori $26,$26,0xd01e
    lui $24,0x0000
    ori $24,$24,0x5863
    subu $0,$8,$24
    nop
    and $17,$26,$24
    sw $17,0($29)
    addu $29,$29,$28
    j block_11
    ori $30,$0,27
    
block_11:
    lui $8,0xffff
    ori $8,$8,0xb249
    lui $24,0x0000
    ori $24,$24,0x5a40
    lui $26,0xffff
    ori $26,$26,0xee3c
    lui $24,0x0000
    ori $24,$24,0x368a
    subu $0,$8,$24
    ori $30,$0,79
    ori $30,$0,87
    and $17,$26,$24
    sw $17,0($29)
    addu $29,$29,$28
    j block_12
    ori $30,$0,80
    
block_12:
    lui $4,0xffff
    ori $4,$4,0x9090
    lui $8,0xffff
    ori $8,$8,0xa425
    lui $23,0xffff
    ori $23,$23,0xe248
    lui $8,0xffff
    ori $8,$8,0xb211
    subu $23,$4,$8
    and $21,$23,$8
    sw $21,0($29)
    addu $29,$29,$28
    j block_13
    ori $30,$0,62
    
block_13:
    lui $4,0xffff
    ori $4,$4,0x91aa
    lui $8,0xffff
    ori $8,$8,0xdd0f
    lui $23,0x0000
    ori $23,$23,0x6065
    lui $8,0xffff
    ori $8,$8,0xcf41
    subu $23,$4,$8
    ori $30,$0,99
    and $21,$23,$8
    sw $21,0($29)
    addu $29,$29,$28
    j block_14
    nop
    
block_14:
    lui $4,0xffff
    ori $4,$4,0xde03
    lui $8,0xffff
    ori $8,$8,0xb1d8
    lui $23,0x0000
    ori $23,$23,0x6719
    lui $8,0x0000
    ori $8,$8,0x111d
    subu $23,$4,$8
    ori $30,$0,52
    ori $30,$0,94
    and $21,$23,$8
    sw $21,0($29)
    addu $29,$29,$28
    j block_15
    nop
    
block_15:
    lui $16,0xffff
    ori $16,$16,0xe3a9
    lui $12,0xffff
    ori $12,$12,0xa026
    lui $0,0x0000
    ori $0,$0,0x2ec1
    lui $12,0x0000
    ori $12,$12,0x0f4e
    subu $0,$16,$12
    and $11,$0,$12
    sw $11,0($29)
    addu $29,$29,$28
    j block_16
    nop
    
block_16:
    lui $16,0x0000
    ori $16,$16,0x4d6f
    lui $12,0x0000
    ori $12,$12,0x14ec
    lui $0,0x0000
    ori $0,$0,0x4ff6
    lui $12,0x0000
    ori $12,$12,0x2bc8
    subu $0,$16,$12
    nop
    and $11,$0,$12
    sw $11,0($29)
    addu $29,$29,$28
    j block_17
    ori $30,$0,51
    
block_17:
    lui $16,0xffff
    ori $16,$16,0xa91c
    lui $12,0x0000
    ori $12,$12,0x06b3
    lui $0,0x0000
    ori $0,$0,0x3d9a
    lui $12,0xffff
    ori $12,$12,0xd604
    subu $0,$16,$12
    ori $30,$0,29
    ori $30,$0,52
    and $11,$0,$12
    sw $11,0($29)
    addu $29,$29,$28
    sw $10, 0($0)
block_17_end:
    j block_17_end
    nop

########################################################################################################

block_18:
    addi $27, $27, 1
    lui $15,0x0000
    ori $15,$15,0x006c
    lui $6,0x0000
    ori $6,$6,0x1377
    lui $6,0xffff
    ori $6,$6,0x96b1
    ori $21,$0,14479
    slt $21,$15,$6
    ori $21,$0,14477
    sh $6,-14457($21)
    sw $21,0($29)
    addu $29,$29,$28
    j block_19
    nop
    
block_19:
    lui $15,0x0000
    ori $15,$15,0x54a7
    lui $6,0x0000
    ori $6,$6,0x2d48
    lui $6,0xffff
    ori $6,$6,0xe7bc
    ori $21,$0,32160
    subu $21,$0,$21
    slt $21,$15,$6
    nop
    ori $21,$0,32160
    subu $21,$0,$21
    sh $6,32220($21)
    sw $21,0($29)
    addu $29,$29,$28
    j block_20
    ori $30,$0,8
    
block_20:
    lui $15,0x0000
    ori $15,$15,0x60ed
    lui $6,0xffff
    ori $6,$6,0x8231
    lui $6,0xffff
    ori $6,$6,0xf76c
    ori $21,$0,4806
    slt $21,$15,$6
    nop
    ori $30,$0,41
    ori $21,$0,4804
    sh $6,-4756($21)
    sw $21,0($29)
    addu $29,$29,$28
    j block_21
    nop
    
block_21:
    lui $17,0xffff
    ori $17,$17,0xe4de
    lui $5,0xffff
    ori $5,$5,0xbe09
    slt $0,$17,$5
    ori $0,$0,0
    sh $5,4($0)
    sw $0,0($29)
    addu $29,$29,$28
    j block_22
    ori $30,$0,54
    
block_22:
    lui $17,0xffff
    ori $17,$17,0x9632
    lui $5,0x0000
    ori $5,$5,0x5f63
    slt $0,$17,$5
    ori $30,$0,5
    ori $0,$0,0
    sh $5,4($0)
    sw $0,0($29)
    addu $29,$29,$28
    j block_23
    ori $30,$0,60
    
block_23:
    lui $17,0xffff
    ori $17,$17,0xf8b5
    lui $5,0xffff
    ori $5,$5,0xb71c
    slt $0,$17,$5
    nop
    nop
    ori $0,$0,0
    sh $5,4($0)
    sw $0,0($29)
    addu $29,$29,$28
    j block_24
    ori $30,$0,58
    
block_24:
    lui $19,0x0000
    ori $19,$19,0x4618
    lui $17,0xffff
    ori $17,$17,0xa3c6
    lui $17,0xffff
    ori $17,$17,0xc609
    ori $25,$0,4301
    subu $25,$0,$25
    slt $8,$19,$17
    sh $17,4325($25)
    sw $8,0($29)
    addu $29,$29,$28
    j block_25
    ori $30,$0,68
    
block_25:
    lui $19,0x0000
    ori $19,$19,0x3281
    lui $17,0x0000
    ori $17,$17,0x60c1
    lui $17,0xffff
    ori $17,$17,0xe8fb
    ori $25,$0,18245
    subu $25,$0,$25
    slt $8,$19,$17
    ori $30,$0,30
    sh $17,18327($25)
    sw $8,0($29)
    addu $29,$29,$28
    j block_26
    ori $30,$0,83
    
block_26:
    lui $19,0xffff
    ori $19,$19,0xd435
    lui $17,0x0000
    ori $17,$17,0x602b
    lui $17,0xffff
    ori $17,$17,0x808e
    ori $25,$0,64
    subu $25,$0,$25
    slt $8,$19,$17
    nop
    ori $30,$0,98
    sh $17,90($25)
    sw $8,0($29)
    addu $29,$29,$28
    j block_27
    ori $30,$0,55
    
block_27:
    lui $11,0xffff
    ori $11,$11,0xa547
    lui $3,0xffff
    ori $3,$3,0xa579
    lui $3,0xffff
    ori $3,$3,0xc5d0
    ori $26,$0,32439
    slt $0,$11,$3
    sh $3,-32393($26)
    sw $0,0($29)
    addu $29,$29,$28
    j block_28
    ori $30,$0,63
    
block_28:
    lui $11,0xffff
    ori $11,$11,0xd1d4
    lui $3,0xffff
    ori $3,$3,0xeb76
    lui $3,0xffff
    ori $3,$3,0xca97
    ori $26,$0,4896
    subu $26,$0,$26
    slt $0,$11,$3
    ori $30,$0,87
    sh $3,4922($26)
    sw $0,0($29)
    addu $29,$29,$28
    j block_29
    nop
    
block_29:
    lui $11,0x0000
    ori $11,$11,0x4996
    lui $3,0x0000
    ori $3,$3,0x175b
    lui $3,0x0000
    ori $3,$3,0x0ad4
    ori $26,$0,25131
    subu $26,$0,$26
    slt $0,$11,$3
    ori $30,$0,35
    ori $30,$0,72
    sh $3,25183($26)
    sw $0,0($29)
    addu $29,$29,$28
    j block_30
    ori $30,$0,44
    
block_30:
    lui $6,0xffff
    ori $6,$6,0xcf61
    lui $24,0x0000
    ori $24,$24,0x4e49
    lui $24,0xffff
    ori $24,$24,0xfe33
    ori $5,$0,18509
    slt $5,$6,$24
    ori $5,$0,18509
    sh $24,-18465($5)
    sw $5,0($29)
    addu $29,$29,$28
    j block_31
    nop
    
block_31:
    lui $6,0xffff
    ori $6,$6,0x8f9c
    lui $24,0x0000
    ori $24,$24,0x7cc9
    lui $24,0xffff
    ori $24,$24,0xf783
    ori $5,$0,460
    slt $5,$6,$24
    ori $30,$0,61
    ori $5,$0,460
    sh $24,-372($5)
    sw $5,0($29)
    addu $29,$29,$28
    j block_32
    ori $30,$0,88
    
block_32:
    lui $6,0x0000
    ori $6,$6,0x19a1
    lui $24,0x0000
    ori $24,$24,0x2c96
    lui $24,0xffff
    ori $24,$24,0xe2ae
    ori $5,$0,22278
    subu $5,$0,$5
    slt $5,$6,$24
    nop
    ori $30,$0,54
    ori $5,$0,22278
    subu $5,$0,$5
    sh $24,22370($5)
    sw $5,0($29)
    addu $29,$29,$28
    j block_33
    ori $30,$0,91
    
block_33:
    lui $21,0x0000
    ori $21,$21,0x7148
    lui $22,0x0000
    ori $22,$22,0x2d5f
    slt $0,$21,$22
    ori $0,$0,0
    sh $22,4($0)
    sw $0,0($29)
    addu $29,$29,$28
    j block_34
    nop
    
block_34:
    lui $21,0xffff
    ori $21,$21,0xf195
    lui $22,0xffff
    ori $22,$22,0xb361
    slt $0,$21,$22
    nop
    ori $0,$0,0
    sh $22,4($0)
    sw $0,0($29)
    addu $29,$29,$28
    j block_35
    nop
    
block_35:
    lui $21,0x0000
    ori $21,$21,0x29c5
    lui $22,0x0000
    ori $22,$22,0x5793
    slt $0,$21,$22
    nop
    ori $30,$0,39
    ori $0,$0,0
    sh $22,4($0)
    sw $0,0($29)
    addu $29,$29,$28
    sw $10, 0($0)

block_35_end:
    j block_35_end
    ori $30,$0,57

##############################################################################################

block_36:
    addi $27, $27, 1
    lui $18,0x0000
    ori $18,$18,0x6f12
    ori $13,$0,22578
    subu $13,$0,$13
    lui $5,0x0000
    ori $5,$5,0x6994
    lui $18,0xffff
    ori $18,$18,0xcf33
    lh $18,22584($13)
    bne $5,$18,jump_block_36
    nop
    jump_back_36:
    
    sw $18,0($29)
    addu $29,$29,$28
    j block_37
    ori $30,$0,29
    
jump_block_36:
    nop
    sw $5, 0($29)
    addu $29,$29,$28
    j jump_back_36
    nop
    
block_37:
    lui $18,0xffff
    ori $18,$18,0xf9ce
    ori $13,$0,19011
    lui $5,0x0000
    ori $5,$5,0x0b5e
    lui $18,0xffff
    ori $18,$18,0xcabd
    lh $18,-18927($13)
    ori $30,$0,35
    bne $5,$18,jump_block_37
    nop
    jump_back_37:
    
    sw $18,0($29)
    addu $29,$29,$28
    j block_38
    ori $30,$0,75
    
jump_block_37:
    nop
    sw $5, 0($29)
    addu $29,$29,$28
    j jump_back_37
    nop
    
block_38:
    lui $18,0x0000
    ori $18,$18,0x5a25
    ori $13,$0,13719
    subu $13,$0,$13
    lui $5,0xffff
    ori $5,$5,0xf65c
    lui $18,0xffff
    ori $18,$18,0xaa32
    lh $18,13723($13)
    nop
    nop
    bne $5,$18,jump_block_38
    nop
    jump_back_38:
    
    sw $18,0($29)
    addu $29,$29,$28
    j block_39
    nop
    
jump_block_38:
    sw $5, 0($29)
    addu $29,$29,$28
    j jump_back_38
    nop
    
block_39:
    lui $0,0xffff
    ori $0,$0,0xfb26
    ori $24,$0,30761
    subu $24,$0,$24
    lui $14,0xffff
    ori $14,$14,0xc804
    lui $0,0xffff
    ori $0,$0,0xa7ec
    lh $0,30873($24)
    bne $14,$0,jump_block_39
    nop
    jump_back_39:
    
    sw $0,0($29)
    addu $29,$29,$28
    j block_40
    ori $30,$0,89
    
jump_block_39:
    sw $14, 0($29)
    addu $29,$29,$28
    j jump_back_39
    nop
    
block_40:
    lui $0,0x0000
    ori $0,$0,0x5684
    ori $24,$0,4523
    lui $14,0xffff
    ori $14,$14,0xaf7a
    lui $0,0xffff
    ori $0,$0,0xc0a5
    lh $0,-4453($24)
    ori $30,$0,5
    bne $14,$0,jump_block_40
    nop
    jump_back_40:
    
    sw $0,0($29)
    addu $29,$29,$28
    j block_41
    nop
    
jump_block_40:
    sw $14, 0($29)
    addu $29,$29,$28
    j jump_back_40
    nop
    
block_41:
    lui $0,0x0000
    ori $0,$0,0x78a6
    ori $24,$0,23228
    subu $24,$0,$24
    lui $14,0x0000
    ori $14,$14,0x4dd3
    lui $0,0xffff
    ori $0,$0,0x8e1f
    lh $0,23248($24)
    nop
    nop
    bne $14,$0,jump_block_41
    nop
    jump_back_41:
    
    sw $0,0($29)
    addu $29,$29,$28
    sw $10, 0($0)
block_41_end:
    j block_41_end
    nop
    
jump_block_41:
    sw $14, 0($29)
    addu $29,$29,$28
    j jump_back_41
    nop


#########################################################################################################

block_42:
    addi $27, $27, 1
    lui $3,0x0000
    ori $3,$3,0x601b
    ori $16,$0,16172
    lui $3,0x0000
    ori $3,$3,0x0102
    lui $3,0x0000
    ori $3,$3,0x6ad6
    lbu $3,-16116($16)
    add $9,$3,$3
    sw $9,0($29)
    addu $29,$29,$28
    j block_43
    ori $30,$0,60
    
block_43:
    lui $3,0xffff
    ori $3,$3,0xb87a
    ori $16,$0,26459
    lui $3,0xffff
    ori $3,$3,0xd397
    lui $3,0xffff
    ori $3,$3,0xebe5
    lbu $3,-26374($16)
    ori $30,$0,70
    add $9,$3,$3
    sw $9,0($29)
    addu $29,$29,$28
    j block_44
    nop
    
block_44:
    lui $3,0xffff
    ori $3,$3,0xa857
    ori $16,$0,10783
    lui $3,0x0000
    ori $3,$3,0x421a
    lui $3,0x0000
    ori $3,$3,0x34e2
    lbu $3,-10662($16)
    nop
    nop
    add $9,$3,$3
    sw $9,0($29)
    addu $29,$29,$28
    j block_45
    ori $30,$0,99
    
block_45:
    lui $0,0x0000
    ori $0,$0,0x63fb
    ori $25,$0,6634
    subu $25,$0,$25
    lui $0,0xffff
    ori $0,$0,0x9014
    lui $0,0x0000
    ori $0,$0,0x2f10
    lbu $0,6646($25)
    add $7,$0,$0
    sw $7,0($29)
    addu $29,$29,$28
    j block_46
    ori $30,$0,61
    
block_46:
    lui $0,0x0000
    ori $0,$0,0x3e54
    ori $25,$0,15084
    lui $0,0xffff
    ori $0,$0,0x8174
    lui $0,0xffff
    ori $0,$0,0x8aed
    lbu $0,-15004($25)
    ori $30,$0,28
    add $7,$0,$0
    sw $7,0($29)
    addu $29,$29,$28
    j block_47
    ori $30,$0,77
    
block_47:
    lui $0,0x0000
    ori $0,$0,0x0586
    ori $25,$0,19744
    subu $25,$0,$25
    lui $0,0xffff
    ori $0,$0,0xc583
    lui $0,0x0000
    ori $0,$0,0x2804
    lbu $0,19842($25)
    nop
    nop
    add $7,$0,$0
    sw $7,0($29)
    addu $29,$29,$28
    j block_48
    nop
    
block_48:
    lui $13,0xffff
    ori $13,$13,0x9711
    ori $21,$0,18609
    lui $15,0xffff
    ori $15,$15,0x8bb6
    lui $13,0xffff
    ori $13,$13,0xb284
    lbu $13,-18486($21)
    add $14,$15,$13
    sw $14,0($29)
    addu $29,$29,$28
    j block_49
    nop
    
block_49:
    lui $13,0x0000
    ori $13,$13,0x59ee
    ori $21,$0,4351
    subu $21,$0,$21
    lui $15,0x0000
    ori $15,$15,0x68d1
    lui $13,0xffff
    ori $13,$13,0x9c37
    lbu $13,4478($21)
    nop
    add $14,$15,$13
    sw $14,0($29)
    addu $29,$29,$28
    j block_50
    nop
    
block_50:
    lui $13,0x0000
    ori $13,$13,0x3b3d
    ori $21,$0,15972
    subu $21,$0,$21
    lui $15,0x0000
    ori $15,$15,0x6eea
    lui $13,0xffff
    ori $13,$13,0xd215
    lbu $13,16053($21)
    ori $30,$0,91
    ori $30,$0,0
    add $14,$15,$13
    sw $14,0($29)
    addu $29,$29,$28
    j block_51
    nop
    
block_51:
    lui $0,0xffff
    ori $0,$0,0xd9ec
    ori $14,$0,30006
    subu $14,$0,$14
    lui $25,0xffff
    ori $25,$25,0xabd8
    lui $0,0xffff
    ori $0,$0,0xb296
    lbu $0,30168($14)
    add $7,$25,$0
    sw $7,0($29)
    addu $29,$29,$28
    j block_52
    ori $30,$0,78
    
block_52:
    lui $0,0x0000
    ori $0,$0,0x6101
    ori $14,$0,15900
    subu $14,$0,$14
    lui $25,0xffff
    ori $25,$25,0xcd2a
    lui $0,0x0000
    ori $0,$0,0x6506
    lbu $0,16020($14)
    ori $30,$0,47
    add $7,$25,$0
    sw $7,0($29)
    addu $29,$29,$28
    j block_53
    ori $30,$0,12
    
block_53:
    lui $0,0xffff
    ori $0,$0,0xefc7
    ori $14,$0,27638
    lui $25,0x0000
    ori $25,$25,0x2ce2
    lui $0,0xffff
    ori $0,$0,0xfce9
    lbu $0,-27576($14)
    nop
    nop
    add $7,$25,$0
    sw $7,0($29)
    addu $29,$29,$28
    j block_54
    nop
    
block_54:
    lui $5,0xffff
    ori $5,$5,0xac3e
    ori $8,$0,22196
    lui $5,0x0000
    ori $5,$5,0x72a2
    lui $5,0x0000
    ori $5,$5,0x5514
    lbu $5,-22151($8)
    add $18,$5,$5
    sw $18,0($29)
    addu $29,$29,$28
    j block_55
    nop
    
block_55:
    lui $5,0xffff
    ori $5,$5,0x9bc3
    ori $8,$0,12899
    subu $8,$0,$8
    lui $5,0x0000
    ori $5,$5,0x7345
    lui $5,0x0000
    ori $5,$5,0x2582
    lbu $5,13104($8)
    ori $30,$0,78
    add $18,$5,$5
    sw $18,0($29)
    addu $29,$29,$28
    j block_56
    ori $30,$0,80
    
block_56:
    lui $5,0x0000
    ori $5,$5,0x6280
    ori $8,$0,26113
    lui $5,0x0000
    ori $5,$5,0x6915
    lui $5,0x0000
    ori $5,$5,0x32e9
    lbu $5,-26016($8)
    ori $30,$0,83
    ori $30,$0,58
    add $18,$5,$5
    sw $18,0($29)
    addu $29,$29,$28
    j block_57
    ori $30,$0,49
    
block_57:
    lui $0,0xffff
    ori $0,$0,0xaed7
    ori $7,$0,11174
    subu $7,$0,$7
    lui $0,0x0000
    ori $0,$0,0x3c73
    lui $0,0x0000
    ori $0,$0,0x03d5
    lbu $0,11199($7)
    add $18,$0,$0
    sw $18,0($29)
    addu $29,$29,$28
    sw $10, 0($0)
block_57_end:
    j block_57_end
    ori $30,$0,25

######################################################################################################

block_58:
    addi $27, $27, 1
    lui $0,0x0000
    ori $0,$0,0x7aff
    ori $7,$0,12139
    lui $0,0xffff
    ori $0,$0,0xffec
    lui $0,0xffff
    ori $0,$0,0xfbb0
    lbu $0,-12056($7)
    nop
    add $18,$0,$0
    sw $18,0($29)
    addu $29,$29,$28
    j block_59
    ori $30,$0,85
    
block_59:
    lui $0,0x0000
    ori $0,$0,0x3068
    ori $7,$0,5120
    lui $0,0x0000
    ori $0,$0,0x55f9
    lui $0,0xffff
    ori $0,$0,0xab48
    lbu $0,-4974($7)
    ori $30,$0,7
    ori $30,$0,84
    add $18,$0,$0
    sw $18,0($29)
    addu $29,$29,$28
    j block_60
    nop
    
block_60:
    lui $5,0xffff
    ori $5,$5,0x96d5
    lui $8,0x0000
    ori $8,$8,0x7fa3
    lui $20,0x0000
    ori $20,$20,0x59d6
    srav $20,$5,$8
    xori $8,$20,0x4437
    sw $8,0($29)
    addu $29,$29,$28
    j block_61
    ori $30,$0,58
    
block_61:
    lui $5,0xffff
    ori $5,$5,0xc8f6
    lui $8,0x0000
    ori $8,$8,0x274e
    lui $20,0x0000
    ori $20,$20,0x0baf
    srav $20,$5,$8
    nop
    xori $8,$20,0x5133
    sw $8,0($29)
    addu $29,$29,$28
    j block_62
    nop
    
block_62:
    lui $5,0x0000
    ori $5,$5,0x1b31
    lui $8,0xffff
    ori $8,$8,0x8400
    lui $20,0x0000
    ori $20,$20,0x6b95
    srav $20,$5,$8
    nop
    ori $30,$0,94
    xori $8,$20,0x5638
    sw $8,0($29)
    addu $29,$29,$28
    j block_63
    nop
    
block_63:
    lui $21,0x0000
    ori $21,$21,0x6a44
    lui $9,0xffff
    ori $9,$9,0x8dd2
    lui $0,0xffff
    ori $0,$0,0xfdac
    srav $0,$21,$9
    xori $9,$0,0x0637
    sw $9,0($29)
    addu $29,$29,$28
    j block_64
    ori $30,$0,16
    
block_64:
    lui $21,0xffff
    ori $21,$21,0x901d
    lui $9,0xffff
    ori $9,$9,0xff3c
    lui $0,0xffff
    ori $0,$0,0x946e
    srav $0,$21,$9
    ori $30,$0,22
    xori $9,$0,0x6798
    sw $9,0($29)
    addu $29,$29,$28
    j block_65
    ori $30,$0,96
    
block_65:
    lui $21,0x0000
    ori $21,$21,0x1e22
    lui $9,0xffff
    ori $9,$9,0xef93
    lui $0,0x0000
    ori $0,$0,0x03df
    srav $0,$21,$9
    ori $30,$0,86
    nop
    xori $9,$0,0x1e07
    sw $9,0($29)
    addu $29,$29,$28
    j block_66
    ori $30,$0,9
    
block_66:
    lui $5,0x0000
    ori $5,$5,0x2e76
    ori $20,$0,20185
    lw $5,-20085($20)
    j jump_block_66
    nop
    jr_back_66:
        addu $5,$0,$31
        jr $5
        nop
    jump_back_66:
    
    sw $5,0($29)
    addu $29,$29,$28
    j block_67
    ori $30,$0,70
    
jump_block_66:
    jal jr_back_66
    nop
    sw $20, 0($29)
    addu $29,$29,$28
    ori $30,$0,4
    j jump_back_66
    nop
    
block_67:
    lui $5,0x0000
    ori $5,$5,0x07e5
    ori $20,$0,26665
    lw $5,-26425($20)
    nop
    j jump_block_67
    nop
    jr_back_67:
        addu $5,$0,$31
        jr $5
        nop
    jump_back_67:
    
    sw $5,0($29)
    addu $29,$29,$28
    j block_68
    nop
    
jump_block_67:
    jal jr_back_67
    nop
    sw $20, 0($29)
    addu $29,$29,$28
    j jump_back_67
    nop
    
block_68:
    lui $5,0x0000
    ori $5,$5,0x7b40
    ori $20,$0,30833
    subu $20,$0,$20
    lw $5,31009($20)
    ori $30,$0,45
    nop
    j jump_block_68
    nop
    jr_back_68:
        addu $5,$0,$31
        jr $5
        nop
    jump_back_68:
    
    sw $5,0($29)
    addu $29,$29,$28
    j block_69
    nop
    
jump_block_68:
    jal jr_back_68
    nop
    sw $20, 0($29)
    addu $29,$29,$28
    j jump_back_68
    nop
    
block_69:
    lui $15,0xffff
    ori $15,$15,0xf893
    ori $22,$0,14019
    lw $15,-13819($22)
    j jump_block_69
    nop
    jr_back_69:
        addu $15,$0,$31
        jr $15
        nop
    jump_back_69:
    
    sw $15,0($29)
    addu $29,$29,$28
    j block_70
    ori $30,$0,88
    
jump_block_69:
    jal jr_back_69
    nop
    sw $15, 0($29)
    addu $29,$29,$28
    j jump_back_69
    nop
    
block_70:
    lui $15,0x0000
    ori $15,$15,0x156e
    ori $22,$0,13380
    lw $15,-13188($22)
    ori $30,$0,54
    j jump_block_70
    nop
    jr_back_70:
        addu $15,$0,$31
        jr $15
        nop
    jump_back_70:
    
    sw $15,0($29)
    addu $29,$29,$28
    sw $10, 0($0)
block_70_end:
    j block_70_end
    ori $30,$0,22
    
jump_block_70:
    jal jr_back_70
    nop
    sw $15, 0($29)
    addu $29,$29,$28
    j jump_back_70
    nop

###################################################################################################
.ktext 0x4180
bne $27, $0, next1
nop
	ori $k0, $0, 0x3034
	mtc0 $k0, $14
	eret
next1:
ori $1, $0, 1
bne $1, $27, next2
nop
	ori $k0, $0, 0x3484
	mtc0 $k0, $14
	eret
next2:
addi $1, $1, 1
bne $1, $27, next3
nop
	ori $k0, $0, 0x3888
	mtc0 $k0, $14
	eret
next3:
addi $1, $1, 1
bne $1, $27, next4
nop
	ori $k0, $0, 0x3a70
	mtc0 $k0, $14
	eret
next4:
addi $1, $1, 1
bne $1, $27, next5
nop
	ori $k0, $0, 0x3e14
	mtc0 $k0, $14
	eret
next5:
addi $1, $1, 1
bne $1, $27, next6
nop
	ori $k0, $0, 0x4244
	mtc0 $k0, $14
	eret
next6:
addi $1, $1, 1
bne $1, $27, next7
nop
	ori $k0, $0, 0x45b0
	mtc0 $k0, $14
	eret
next7:
addi $1, $1, 1
bne $1, $27, next8
nop
	ori $k0, $0, 0x49e0
	mtc0 $k0, $14
	eret
next8:
	j next8
	nop

block_71:
    addi $27, $27, 1
    lui $15,0x0000
    ori $15,$15,0x0515
    ori $22,$0,6915
    lw $15,-6695($22)
    ori $30,$0,47
    nop
    j jump_block_71
    nop
    jr_back_71:
        addu $15,$0,$31
        jr $15
        nop
    jump_back_71:
    
    sw $15,0($29)
    addu $29,$29,$28
    j block_72
    ori $30,$0,61
    
jump_block_71:
    jal jr_back_71
    nop
    sw $15, 0($29)
    addu $29,$29,$28
    j jump_back_71
    nop
    
block_72:
    lui $1,0x0000
    ori $1,$1,0x2ee5
    lui $24,0x0000
    ori $24,$24,0x4ad4
    lui $24,0x0000
    ori $24,$24,0x44ee
    ori $26,$0,30105
    nor $26,$1,$24
    ori $26,$0,30104
    lbu $24,-30020($26)
    sw $24,0($29)
    addu $29,$29,$28
    j block_73
    ori $30,$0,81
    
block_73:
    lui $1,0x0000
    ori $1,$1,0x3105
    lui $24,0xffff
    ori $24,$24,0xec5d
    lui $24,0x0000
    ori $24,$24,0x1cea
    ori $26,$0,8992
    nor $26,$1,$24
    ori $30,$0,16
    ori $26,$0,8990
    lbu $24,-8798($26)
    sw $24,0($29)
    addu $29,$29,$28
    j block_74
    nop
    
block_74:
    lui $1,0xffff
    ori $1,$1,0xf566
    lui $24,0xffff
    ori $24,$24,0x89ef
    lui $24,0x0000
    ori $24,$24,0x1b42
    ori $26,$0,22880
    nor $26,$1,$24
    nop
    ori $30,$0,41
    ori $26,$0,22879
    lbu $24,-22635($26)
    sw $24,0($29)
    addu $29,$29,$28
    j block_75
    ori $30,$0,52
    
block_75:
    lui $2,0x0000
    ori $2,$2,0x70ed
    lui $21,0xffff
    ori $21,$21,0xd74a
    nor $0,$2,$21
    ori $0,$0,0
    lbu $21,4($0)
    sw $21,0($29)
    addu $29,$29,$28
    j block_76
    ori $30,$0,69
    
block_76:
    lui $2,0xffff
    ori $2,$2,0x9779
    lui $21,0x0000
    ori $21,$21,0x5ba5
    nor $0,$2,$21
    ori $30,$0,39
    ori $0,$0,0
    lbu $21,4($0)
    sw $21,0($29)
    addu $29,$29,$28
    j block_77
    ori $30,$0,63
    
block_77:
    lui $2,0x0000
    ori $2,$2,0x2fc9
    lui $21,0x0000
    ori $21,$21,0x6130
    nor $0,$2,$21
    ori $30,$0,95
    nop
    ori $0,$0,0
    lbu $21,4($0)
    sw $21,0($29)
    addu $29,$29,$28
    j block_78
    nop
    
block_78:
    lui $13,0xffff
    ori $13,$13,0xa194
    lui $26,0xffff
    ori $26,$26,0x88b8
    lui $22,0x0000
    ori $22,$22,0x266a
    lui $26,0x0000
    ori $26,$26,0x34c9
    sltu $22,$13,$26
    subu $25,$22,$26
    sw $25,0($29)
    addu $29,$29,$28
    j block_79
    ori $30,$0,10
    
block_79:
    lui $13,0x0000
    ori $13,$13,0x3a83
    lui $26,0x0000
    ori $26,$26,0x10ca
    lui $22,0x0000
    ori $22,$22,0x2401
    lui $26,0xffff
    ori $26,$26,0xc4e8
    sltu $22,$13,$26
    nop
    subu $25,$22,$26
    sw $22,0($29)
    addu $29,$29,$28
    j block_80
    nop
    
block_80:
    lui $13,0xffff
    ori $13,$13,0x9a57
    lui $26,0x0000
    ori $26,$26,0x1431
    lui $22,0x0000
    ori $22,$22,0x0887
    lui $26,0x0000
    ori $26,$26,0x5234
    sltu $22,$13,$26
    ori $30,$0,43
    nop
    subu $25,$22,$26
    sw $22,0($29)
    addu $29,$29,$28
    j block_81
    nop
    
block_81:
    lui $3,0x0000
    ori $3,$3,0x3ff1
    lui $8,0x0000
    ori $8,$8,0x666e
    lui $0,0x0000
    ori $0,$0,0x3df7
    lui $8,0xffff
    ori $8,$8,0xe387
    sltu $0,$3,$8
    subu $21,$0,$8
    sw $0,0($29)
    addu $29,$29,$28
    j block_82
    ori $30,$0,92
    
block_82:
    lui $3,0x0000
    ori $3,$3,0x4c8b
    lui $8,0xffff
    ori $8,$8,0x8935
    lui $0,0xffff
    ori $0,$0,0xc8d3
    lui $8,0xffff
    ori $8,$8,0x806b
    sltu $0,$3,$8
    ori $30,$0,64
    subu $21,$0,$8
    sw $0,0($29)
    addu $29,$29,$28
    j block_83
    nop
    
block_83:
    lui $3,0xffff
    ori $3,$3,0x8213
    lui $8,0xffff
    ori $8,$8,0xb92e
    lui $0,0x0000
    ori $0,$0,0x5ea6
    lui $8,0xffff
    ori $8,$8,0xd2f5
    sltu $0,$3,$8
    ori $30,$0,30
    nop
    subu $21,$0,$8
    sw $0,0($29)
    addu $29,$29,$28
    j block_84
    ori $30,$0,12
    
block_84:
    lui $26,0x0000
    ori $26,$26,0x23e8
    lui $17,0x0000
    ori $17,$17,0x1d22
    lui $11,0x0000
    ori $11,$11,0x7475
    slt $11,$26,$17
    andi $17,$11,0x3d23
    sw $11,0($29)
    addu $29,$29,$28
    j block_85
    ori $30,$0,24
    
block_85:
    lui $26,0x0000
    ori $26,$26,0x3341
    lui $17,0x0000
    ori $17,$17,0x11d7
    lui $11,0xffff
    ori $11,$11,0xc3bc
    slt $11,$26,$17
    nop
    andi $17,$11,0x3674
    sw $11,0($29)
    addu $29,$29,$28
    sw $10, 0($0)
block_85_end:
    j block_85_end
    ori $30,$0,54

########################################################################################################

block_86:
    addi $27, $27, 1
    lui $26,0xffff
    ori $26,$26,0xbbbf
    lui $17,0x0000
    ori $17,$17,0x1083
    lui $11,0x0000
    ori $11,$11,0x0c8c
    slt $11,$26,$17
    nop
    ori $30,$0,48
    andi $17,$11,0x37f5
    sw $11,0($29)
    addu $29,$29,$28
    j block_87
    nop
    
block_87:
    lui $19,0xffff
    ori $19,$19,0xa985
    lui $6,0x0000
    ori $6,$6,0x2edb
    lui $0,0x0000
    ori $0,$0,0x3481
    slt $0,$19,$6
    andi $6,$0,0x429c
    sw $0,0($29)
    addu $29,$29,$28
    j block_88
    nop
    
block_88:
    lui $19,0xffff
    ori $19,$19,0xf89d
    lui $6,0xffff
    ori $6,$6,0xd7f3
    lui $0,0x0000
    ori $0,$0,0x707e
    slt $0,$19,$6
    nop
    andi $6,$0,0x4ec2
    sw $0,0($29)
    addu $29,$29,$28
    j block_89
    ori $30,$0,12
    
block_89:
    lui $19,0x0000
    ori $19,$19,0x0546
    lui $6,0x0000
    ori $6,$6,0x6b71
    lui $0,0xffff
    ori $0,$0,0xeca0
    slt $0,$19,$6
    ori $30,$0,63
    nop
    andi $6,$0,0x3f74
    sw $0,0($29)
    addu $29,$29,$28
    j block_90
    nop
    
block_90:
    lui $18,0xffff
    ori $18,$18,0xede5
    lui $7,0x0000
    ori $7,$7,0x77fa
    lui $11,0x0000
    ori $11,$11,0x6be0
    slt $11,$18,$7
    andi $7,$11,0x398b
    sw $11,0($29)
    addu $29,$29,$28
    j block_91
    nop
    
block_91:
    lui $18,0x0000
    ori $18,$18,0x1af9
    lui $7,0xffff
    ori $7,$7,0xf2ca
    lui $11,0xffff
    ori $11,$11,0xa39c
    slt $11,$18,$7
    nop
    andi $7,$11,0x472e
    sw $11,0($29)
    addu $29,$29,$28
    j block_92
    ori $30,$0,14
    
block_92:
    lui $18,0x0000
    ori $18,$18,0x1708
    lui $7,0xffff
    ori $7,$7,0xa3bf
    lui $11,0x0000
    ori $11,$11,0x3fd2
    slt $11,$18,$7
    nop
    ori $30,$0,76
    andi $7,$11,0x351b
    sw $11,0($29)
    addu $29,$29,$28
    j block_93
    nop
    
block_93:
    lui $26,0xffff
    ori $26,$26,0xf477
    lui $13,0x0000
    ori $13,$13,0x052b
    lui $0,0x0000
    ori $0,$0,0x4f43
    slt $0,$26,$13
    andi $13,$0,0x6e03
    sw $0,0($29)
    addu $29,$29,$28
    j block_94
    nop
    
block_94:
    lui $26,0x0000
    ori $26,$26,0x5d91
    lui $13,0x0000
    ori $13,$13,0x73e0
    lui $0,0xffff
    ori $0,$0,0xffe1
    slt $0,$26,$13
    ori $30,$0,11
    andi $13,$0,0x3150
    sw $0,0($29)
    addu $29,$29,$28
    j block_95
    ori $30,$0,98
    
block_95:
    lui $26,0x0000
    ori $26,$26,0x6a4c
    lui $13,0xffff
    ori $13,$13,0xd22e
    lui $0,0x0000
    ori $0,$0,0x3bf0
    slt $0,$26,$13
    ori $30,$0,94
    nop
    andi $13,$0,0x5d6f
    sw $0,0($29)
    addu $29,$29,$28
    j block_96
    ori $30,$0,26
    
block_96:
    lui $13,0xffff
    ori $13,$13,0xd9d3
    lui $14,0xffff
    ori $14,$14,0xa8b5
    lui $7,0x0000
    ori $7,$7,0x7ce0
    lui $14,0xffff
    ori $14,$14,0x97be
    sltu $7,$13,$14
    srav $9,$7,$14
    sw $7,0($29)
    addu $29,$29,$28
    j block_97
    nop
    
block_97:
    lui $13,0xffff
    ori $13,$13,0xb1cb
    lui $14,0x0000
    ori $14,$14,0x2316
    lui $7,0xffff
    ori $7,$7,0x943f
    lui $14,0xffff
    ori $14,$14,0xa90b
    sltu $7,$13,$14
    ori $30,$0,82
    srav $9,$7,$14
    sw $7,0($29)
    addu $29,$29,$28
    j block_98
    ori $30,$0,20
    
block_98:
    lui $13,0xffff
    ori $13,$13,0x91db
    lui $14,0xffff
    ori $14,$14,0x9519
    lui $7,0xffff
    ori $7,$7,0xb75d
    lui $14,0xffff
    ori $14,$14,0xb13f
    sltu $7,$13,$14
    ori $30,$0,4
    ori $30,$0,16
    srav $9,$7,$14
    sw $7,0($29)
    addu $29,$29,$28
    j block_99
    ori $30,$0,26
    
block_99:
    lui $9,0x0000
    ori $9,$9,0x1932
    lui $6,0x0000
    ori $6,$6,0x539a
    lui $0,0x0000
    ori $0,$0,0x7f46
    lui $6,0x0000
    ori $6,$6,0x2bde
    sltu $0,$9,$6
    srav $21,$0,$6
    sw $0,0($29)
    addu $29,$29,$28
    j block_100
    ori $30,$0,57
    
block_100:
    lui $9,0xffff
    ori $9,$9,0xa409
    lui $6,0x0000
    ori $6,$6,0x7583
    lui $0,0xffff
    ori $0,$0,0xe1d9
    lui $6,0x0000
    ori $6,$6,0x0ce5
    sltu $0,$9,$6
    ori $30,$0,43
    srav $21,$0,$6
    sw $0,0($29)
    addu $29,$29,$28
    j block_101
    nop
    
block_101:
    lui $9,0xffff
    ori $9,$9,0x9498
    lui $6,0xffff
    ori $6,$6,0xa724
    lui $0,0x0000
    ori $0,$0,0x607a
    lui $6,0xffff
    ori $6,$6,0xa935
    sltu $0,$9,$6
    nop
    ori $30,$0,60
    srav $21,$0,$6
    sw $0,0($29)
    addu $29,$29,$28
    j block_102
    nop
    
block_102:
    lui $22,0x0000
    ori $22,$22,0x235d
    lui $17,0x0000
    ori $17,$17,0x1e7c
    lui $24,0xffff
    ori $24,$24,0xb3d1
    lui $17,0x0000
    ori $17,$17,0x5bbd
    sltu $8,$22,$17
    srav $1,$24,$17
    sw $8,0($29)
    addu $29,$29,$28
    j block_103
    nop
    
block_103:
    lui $22,0x0000
    ori $22,$22,0x6fc8
    lui $17,0xffff
    ori $17,$17,0xfa18
    lui $24,0x0000
    ori $24,$24,0x3e3d
    lui $17,0xffff
    ori $17,$17,0xeace
    sltu $8,$22,$17
    ori $30,$0,21
    srav $1,$24,$17
    sw $8,0($29)
    addu $29,$29,$28
    j block_104
    ori $30,$0,6
    
block_104:
    lui $22,0xffff
    ori $22,$22,0xa20e
    lui $17,0xffff
    ori $17,$17,0xb284
    lui $24,0xffff
    ori $24,$24,0x8e5b
    lui $17,0xffff
    ori $17,$17,0xce34
    sltu $8,$22,$17
    nop
    ori $30,$0,98
    srav $1,$24,$17
    sw $8,0($29)
    addu $29,$29,$28
    sw $10, 0($0)
block_105_end:
    j block_105
    ori $30,$0,9
    
###############################################################################################

block_105:
    addi $27, $27, 1
    lui $2,0x0000
    ori $2,$2,0x5a0b
    lui $7,0xffff
    ori $7,$7,0xa39b
    lui $14,0xffff
    ori $14,$14,0xb047
    lui $7,0xffff
    ori $7,$7,0xe8ab
    sltu $0,$2,$7
    srav $25,$14,$7
    sw $0,0($29)
    addu $29,$29,$28
    j block_106
    nop
    
block_106:
    lui $2,0x0000
    ori $2,$2,0x21ec
    lui $7,0x0000
    ori $7,$7,0x62df
    lui $14,0xffff
    ori $14,$14,0xc85f
    lui $7,0x0000
    ori $7,$7,0x7b1a
    sltu $0,$2,$7
    nop
    srav $25,$14,$7
    sw $0,0($29)
    addu $29,$29,$28
    j block_107
    ori $30,$0,2
    
block_107:
    lui $2,0xffff
    ori $2,$2,0xa451
    lui $7,0x0000
    ori $7,$7,0x5008
    lui $14,0x0000
    ori $14,$14,0x429f
    lui $7,0x0000
    ori $7,$7,0x3ec3
    sltu $0,$2,$7
    ori $30,$0,47
    ori $30,$0,64
    srav $25,$14,$7
    sw $0,0($29)
    addu $29,$29,$28
    j block_108
    nop
    
block_108:
    lui $20,0xffff
    ori $20,$20,0xb1f1
    lui $14,0xffff
    ori $14,$14,0x9659
    lui $4,0x0000
    ori $4,$4,0x774c
    lui $14,0x0000
    ori $14,$14,0x4945
    sltu $4,$20,$14
    srav $2,$4,$14
    sw $4,0($29)
    addu $29,$29,$28
    j block_109
    nop
    
block_109:
    lui $20,0x0000
    ori $20,$20,0x5c5b
    lui $14,0xffff
    ori $14,$14,0x9a3d
    lui $4,0x0000
    ori $4,$4,0x2835
    lui $14,0x0000
    ori $14,$14,0x5d10
    sltu $4,$20,$14
    ori $30,$0,75
    srav $2,$4,$14
    sw $4,0($29)
    addu $29,$29,$28
    j block_110
    nop
    
block_110:
    lui $20,0x0000
    ori $20,$20,0x2232
    lui $14,0xffff
    ori $14,$14,0xf04f
    lui $4,0xffff
    ori $4,$4,0xb26c
    lui $14,0x0000
    ori $14,$14,0x4c29
    sltu $4,$20,$14
    nop
    nop
    srav $2,$4,$14
    sw $4,0($29)
    addu $29,$29,$28
    j block_111
    nop
    
block_111:
    lui $14,0x0000
    ori $14,$14,0x2b96
    lui $13,0x0000
    ori $13,$13,0x20e0
    lui $0,0xffff
    ori $0,$0,0xf639
    lui $13,0xffff
    ori $13,$13,0xd4c2
    sltu $0,$14,$13
    srav $8,$0,$13
    sw $0,0($29)
    addu $29,$29,$28
    j block_112
    ori $30,$0,98
    
block_112:
    lui $14,0xffff
    ori $14,$14,0x890e
    lui $13,0xffff
    ori $13,$13,0xae41
    lui $0,0x0000
    ori $0,$0,0x2ef1
    lui $13,0xffff
    ori $13,$13,0xcf46
    sltu $0,$14,$13
    nop
    srav $8,$0,$13
    sw $0,0($29)
    addu $29,$29,$28
    j block_113
    ori $30,$0,98
    
block_113:
    lui $14,0xffff
    ori $14,$14,0xa310
    lui $13,0xffff
    ori $13,$13,0xe8dd
    lui $0,0xffff
    ori $0,$0,0xbd5e
    lui $13,0xffff
    ori $13,$13,0x8dc6
    sltu $0,$14,$13
    ori $30,$0,98
    nop
    srav $8,$0,$13
    sw $0,0($29)
    addu $29,$29,$28

    lui $10, 0xffff
    ori $10, $10, 0xeeee
    sw $10, 0($0)
block_114:
    j block_114
    nop



