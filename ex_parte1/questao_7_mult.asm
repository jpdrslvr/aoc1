# Escreva um programa que calcule o valor de
# 4x - 2y + 3z (armazene os valores de x, y e z em $t1, $t2 e $t3,
# respectivamente) e coloque o resultado em $t7. Faça testes com alguns
# valores diferentes de x, y e z. Utilize apenas instruções já vistas na
# disciplina.

# teste: x = 5, y = 10, z = 15

# UTILIZANDO MULT
# inicializa valores
ori $t1, $zero, 0x5
ori $t2, $zero, 0xa
ori $t3, $zero, 0xf

ori $t4, $zero, 0x4 # coeficiente
mul $t7, $t1, $t4

ori $t4, $zero, 0x2
mul $t5, $t2, $t4
sub $t7, $t7, $t5

ori $t4, $zero, 0x3
mul $t5, $t3, $t4
add $t7, $t7, $t5
