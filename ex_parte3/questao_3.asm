# Escreva um programa que leia um valor x > 0 da memória (posição 0x10010000) e
# calcule o x-ésimo termo da série de Fibonacci:
# 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
# Escreva o x-ésimo termo da série (y) em uma palavra (4 bytes) de memória. O
# resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
# memória .data. Inicie o código com: 

.data
	x: .word 7
	y: .space 4
	
.text
	lui $t0, 0x1001 # início da memória de dados
	lw $t1, 0x0($t0)
	
	# $t2 = 0; primeiro termo
	# $t3 = 1; segundo termo
	# $t4 = $t2 + $t3; próximo termo
	
	ori $t3, $zero, 1

	ori $t5, $zero, 1 # contador
	
	fib:
		add $t4, $t2, $t3
		or $t2, $zero, $t3
		or $t3, $zero, $t4
		
		addi $t5, $t5, 1 # incrementa contador
		
		beq $t5, $t1, exit
		j fib
		
	exit:
		sw $t4, 0x4($t0)