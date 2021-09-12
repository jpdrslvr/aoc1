#Faça um programa que calcule o seguinte polinômio usando o método de Horner:
# y = 9a^3 - 5a^2 + 7a + 15

.data
	a: .word 2
	y: .space 4
	
.text
	ori $t1, $zero, 9
	addiu $t2, $zero, -5
	ori $t3, $zero, 7
	ori $t4, $zero, 15
	
	lui $t0, 0x1001 # início da memória de dados
	lw $t5, 0x0($t0) # $t5 = a
	
	mult $t5, $t1
	mflo $t6 # resultado
	add $t6, $t6, $t2
	
	mult $t5, $t6
	mflo $t6
	add $t6, $t6, $t3
	
	mult $t5, $t6
	mflo $t6
	add $t6, $t6, $t4
	
	sw $t6, 0x4($t0)