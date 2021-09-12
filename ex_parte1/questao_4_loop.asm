# Escreva a sequência 0x12345678 em $t1. A seguir, escreva um código
# que inverta a sequência, escrevendo 0x87654321 em $t2. Obviamente o
# código deve inverter os bits de $t1 e não simplesmente
# escrever 0x87654321 diretamente em $t2.

ori $t1, $zero, 0x1234
sll $t1, $t1, 16
ori $t1, $t1, 0x5678

# $t5 -> incremento do loop
ori $t6, $zero, 28 # condição de saída do loop

loop:
	srlv $t3, $t1, $t5
	sll $t3, $t3, 28
	srlv $t3, $t3, $t5
	or $t2, $t2, $t3
	
	beq $t5, $t6, exit
	
	addi $t5, $t5, 4
	
	j loop

exit: