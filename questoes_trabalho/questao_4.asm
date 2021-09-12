# Escreva um programa que calcule o fatorial de n.
# O valor de n deve ser lido da memória na posição 0x10010000 e o valor de n! deve
# ser escrito na posição seguinte na memória (0x10010004).

.data
	n: .word 8
	
.text
	lui $t0,  0x1001
	
	lw $t1, 0x0($t0) # $t1 = n
	
	ori $t2, $zero, 1 # valor inicial de n!
	
	loop:
		beq $t1, $zero, exit # n == 0
		
		mult $t2, $t1 # n * (n - 1)
		mflo $t2
		
		addiu $t1, $t1, -1 # n -= 1
		
		j loop
		
	exit:
		sw $t2, 0x4($t0)