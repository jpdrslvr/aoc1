# Uma temperatura, armazenada em $t0, pode ficar em dois intervalos:
# 20 ≤ temp ≤ 40 e
# 60 ≤ temp ≤ 80. 
# Escreva um programa que coloque uma flag (registrador $t1) para 1 se a
# temperatura está entre os valores permitidos e para 0 caso contrário
ori $t0, $zero, 40


# intervalos
ori $t2, $zero, 19
ori $t3, $zero, 41
ori $t4, $zero, 59
ori $t5, $zero, 81


slt $t7, $t0, $t3 # temp <= 40
slt $t8, $t2, $t0 # temp >= 20

and $t9, $t7, $t8 # temp <= 40 && temp >= 20

slt $s0, $t0, $t5 # temp <= 80
slt $s1, $t4, $t0 # temp >= 60

and $s2, $s0, $s1 # temp <= 80 && temp >= 60

or $t1, $t9, $s2


