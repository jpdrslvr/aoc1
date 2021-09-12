# Faça um programa que calcule o seguinte polinômio usando o método de Horner:
# y = - ax^4 + bx^3 - cx^2 + dx - e

.data
	a: .word -3
	b: .word 7
	c: .word 5
	d: .word -2
	e: .word 8
	x: .word 4
	y: .space 4
	
.text
	lui $t0, 0x1001 # início da memória de dados
	lw $t1, 0x0($t0) # $t1 = a
	lw $t2, 0x4($t0) # $t2 = b
	lw $t3, 0x8($t0) # $t3 = c
	lw $t4, 0xc($t0) # $t4 = d
	lw $t5, 0x10($t0) # $t5 = e
	lw $t6, 0x14($t0) # $t6 = x
	
	# corrige sinais de coeficientes
	sub $t1, $zero, $t1
	sub $t3, $zero, $t3
	sub $t5, $zero, $t5
	
	mult $t6, $t1
	mflo $t8 # resultado
	add $t8, $t8, $t2
	
	mult $t6, $t8
	mflo $t8
	add $t8, $t8, $t3
	
	mult $t6, $t8
	mflo $t8
	add $t8, $t8, $t4
	
	mult $t6, $t8
	mflo $t8
	add $t8, $t8, $t5
	
	sw $t8, 0x18($t0)