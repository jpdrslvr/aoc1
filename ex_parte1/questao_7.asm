# Escreva um programa que calcule o valor de
# 4x - 2y + 3z (armazene os valores de x, y e z em $t1, $t2 e $t3,
# respectivamente) e coloque o resultado em $t7. Faça testes com alguns
# valores diferentes de x, y e z. Utilize apenas instruções já vistas na
# disciplina.

# teste: x = 5, y = 10, z = 15

# UTILIZANDO APENAS ADD E SUB
# inicializa valores
ori $t1, $zero, 0x5
ori $t2, $zero, 0xa
ori $t3, $zero, 0xf

add $t7, $t1, $t1 # x*2
add $t7, $t7, $t7 # x*2

sub $t7, $t7, $t2 # t7 - y
sub $t7, $t7, $t2 # t7 - y

add $t7, $t7, $t3 # t7 + z
add $t7, $t7, $t3 # t7 + z
add $t7, $t7, $t3 # t7 + z