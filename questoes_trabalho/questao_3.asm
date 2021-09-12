# Escreva um programa que encontre a mediana de três valores lidos da memória. A
# mediana deve ser salva na posição 0x1001000C da memória.
# Exemplos:

.data
	a: .word -10
	b: .word -1
	c: .word 3
	
.text
	# posição inicial da memória
	lui $t0, 0x1001
	
	lw $t1, 0x0($t0) # t1 = a
	lw $t2, 0x4($t0) # t2 = b
	lw $t3, 0x8($t0) # t3 = c
	
	slt $t4, $t2, $t1 # b < a
	slt $t5, $t1, $t3 # a < c
	and $t6, $t4, $t5
	bne $t6, $zero, A
	
	slt $t4, $t1, $t2 # a < b
	slt $t5, $t2, $t3 # b < c
	and $t6, $t4, $t5
	bne $t6, $zero, B
	
	sw $t3, 0xc($t0)  # mediana = c
	j exit
	
	A:
		sw $t1, 0xc($t0)  # mediana = a
		j exit
		
	B: 
		sw $t2, 0xc($t0)  # mediana = b
		j exit
		
	exit: