# Escreva um programa que calcule o produtório abaixo. O valor de n deve ser lido da
# posição 0x10010000 da memória no início do programa. O valor de A deve ser
# escrito na memória no fim do programa, na posição 0x10010004. 
#
# A = prod(n + i/2) 0 -> n
# n = 5
# (5 + 0)*(5 + 0)*(5 + 1)*(5 + 1)*(5 + 2)*(5 + 2)
.data
	n: .word 5
 	
.text
	# posição inicial da memória
	lui $t0, 0x1001
	
	lw $t1, 0x0($t0) # t1 = n
	
	# resultado em $t4
	ori $t4, $zero, 1
	
	loop:
	srl $t3, $t2, 1   # i / 2
	add $t3, $t3, $t1 # n + i/2
	
	mult $t4, $t3
	mflo $t4
	
	# fim do loop
	beq $t2, $t1, exit
		
	# incrementa contador
	addi $t2, $t2, 1
	j loop
	
	exit:
		sw $t4, 0x4($t0)