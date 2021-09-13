# Escreva um programa que calcule o número de bits significativos de um número
# inteiro positivo. Inicie o programa com a instrução ori $t1, $0, x, substituindo x pelo
# valor desejado. Armazene o resultado final no registrador $t2.

ori $t1, $zero, 7000   
ori $t2, $zero, 32       # número total de bits (resultado final)
ori $t3, $zero, 2        # número 2 pra multiplicação

loop:
	mult $t1, $t3          # multiplicação por 2 equivalente a um shift para esquerda com overflow
	mfhi $t4               # valor do overflow da mult; se != 0 não é o MSB

	bne $t4, $zero, exit
	addiu $t2, $t2, -1     # decrementa 1

	sll $t3, $t3, 1				 # multiplica $t3 por 2; a próxima multiplicação será por 2^i; i = 32 - $t2
	j loop

exit:
