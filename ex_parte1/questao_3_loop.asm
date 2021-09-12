# Comece um programa pela instrução: ori $t1, $zero, 0x01. Usando
# apenas as instruções lógicas do tipo R (dois registradores como
# operandos) or, and e xor e instruções de shift (isto é, sem usar outras
# instruções ori além da inicial e nem instruções nor),
# escreva 0xFFFFFFFF em $t1. Procure usar o menor número de
# instruções possível.

# $t1 resultado
# $t2 auxiliar
# $t3 número de bits pro shift
# $t4 = 16; condição de saída do loop

ori $t1, $zero, 0x01
or $t2, $t1, $t1 # copia para $t2
or $t3, $t1, $t1 # copia para $t3
or $t4, $t1, $t1 # copia para $t4
sll $t4, $t4, 4

loop:
	sllv $t1, $t1, $t3
	or $t1, $t1, $t2 # $t1 = 0b...11
	beq $t3, $t4, exit
	sll $t3, $t3, 1
	or $t2, $t1, $t1 # copia para $t2
	j loop
exit: