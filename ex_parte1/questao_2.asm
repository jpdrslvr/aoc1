# Escreva 0xAAAAAAAA em $t1. Faça um shift de um bit para a direita
# desse valor e coloque o resultado em $t2, deixando $t1 inalterado. Em
# $t3, $t4 e $t5 coloque os resultados das operações or, and e xor entre
# $t1 e $t2, respectivamente. Em comentários no final do código, explique
# os resultados obtidos, mostrando os valores binários.

# escreve 0xAAAAAAAA em $t1, 16 bits de cada vez
ori $t1, $zero, 0xaaaa
sll $t1, $t1, 16
ori $t1, $t1, 0xaaaa

# shift de 1 bit para a direita
srl $t2, $t1, 1

# $t1 or $t2
or $t3, $t1, $t2

# $t1 and $t2
and $t4, $t1, $t2

# $t1 xor $t2
xor $t5, $t1, $t2

# $t1 =         0b10101010101010101010101010101010
# $t2 =         0b01010101010101010101010101010101

# a operação or bit a bit sempre vai ser entre 0 e 1, sempre resultando em 1 (ordem não importa)
# $t1 or $t2 =  0b11111111111111111111111111111111

# a operação and bit a bit sempre vai ser entre 0 e 1, sempre resultando em 0  (ordem não importa)
# $t1 and $t2 = 0b0000000000000000000000000000000

# a operação xor bit a bit sempre vai ser entre 0 e 1 ou 1 e 0
# operação xor retorna 1 se os bits forem diferentes, então nesse caso sempre retorna 1
# $t1 and $t2 = 0b11111111111111111111111111111111
