# Faça um programa que calcule a seguinte equação:
# y = 32ab - 3a + 7b - 13

.data
	a: .word 3
	b: .word 5
	y: .space 4

.text
	ori $t1, $zero, 32
	ori $t2, $zero, 3
	ori $t3, $zero, 7
	ori $t4, $zero, 13

	lui $t0, 0x1001 # início da memória de dados
	lw $t5, 0x0($t0) # $t5 = a
	lw $t6, 0x4($t0) # $t6 = b
	
	mult $t1, $t5 # 32a
	mflo $t7
	mult $t7, $t6 # 32ab
	mflo $t7
	
	mult $t2, $t5 # 3a
	mflo $t8
	sub $t7, $t7, $t8 # 32ab - 3a
	
	mult $t3, $t6 # 7b
	mflo $t8
	add $t7, $t7, $t8 # 32ab - 3a + 7b
	
	sub $t7, $t7, $t4
	
	sw $t7, 0x8($t0)