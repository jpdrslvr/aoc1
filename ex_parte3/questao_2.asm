# Escreva um programa que calcule:
# 1 + 2 + 3 + … + 333
# Escreva o resultado (y) em uma palavra (4 bytes) de memória. O resultado deve ser
# armazenado, obrigatoriamente, na posição 0x10010000 da memória .data.

.data
	y: .space 4
	
.text
	ori $t1, $zero, 1   # valor inicial
	ori $t2, $zero, 1   # incremento
	ori $t3, $zero, 333 # condição
	
	loop:
		addi $t2, $t2, 1
		add $t1, $t1, $t2
		beq $t2, $t3, exit
		j loop
	
	exit:
		lui $t0, 0x1001 # início da memória de dados
		sw $t1, 0x0($t0)
		