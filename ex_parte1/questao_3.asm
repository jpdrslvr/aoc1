# Comece um programa pela instrução: ori $t1, $zero, 0x01. Usando
# apenas as instruções lógicas do tipo R (dois registradores como
# operandos) or, and e xor e instruções de shift (isto é, sem usar outras
# instruções ori além da inicial e nem instruções nor),
# escreva 0xFFFFFFFF em $t1. Procure usar o menor número de
# instruções possível.

ori $t1, $zero, 0x01
or $t2, $t1, $t1 # copia para $t2
sll $t1, $t1, 1

or $t1, $t1, $t2 # $t1 = 0b...11
or $t2, $t1, $t1 # copia para $t2
sll $t1, $t1, 2  # $t1 = 0b...1100

or $t1, $t1, $t2 # 0x0000000f
or $t2, $t1, $t1 # copia para $t2
sll $t1, $t1, 4  # $t1 = 0b...1100

or $t1, $t1, $t2 # 0x000000ff
or $t2, $t1, $t1 # copia para $t2
sll $t1, $t1, 8  # $t1 = 0b...1100

or $t1, $t1, $t2 # 0x0000ffff
or $t2, $t1, $t1 # copia para $t2
sll $t1, $t1, 16

or $t1, $t1, $t2 # 0xffffffff
