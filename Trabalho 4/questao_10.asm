# Escreva um programa que conte com três subrotinas capazes de calcular a área da
# circunferência (π*r^2), do triângulo (b*a/2) e do retângulo (b*a). Inicialmente,
# pergunte ao usuário (use syscall) qual forma geométrica ele deseja (armazenando no
# registrador $t0) e depois solicite as medidas necessárias para calcular a área de cada
# forma (armazenar para circunferência o valor r em $t0, triângulo e retângulo
# armazenar valor de a e b em $t0 e $t1, respectivamente). Ao final, imprima a área
# desejada. Respeite as convenções de uso dos registradores.
# Considere π=3.

.data
	str1: .asciiz "Escolha a forma geométrica para calcular a área.\nCírculo (0), Triângulo (1) ou retângulo (2)? "
	str2: .asciiz "Raio: "
	str3: .asciiz "Base: "
	str4: .asciiz "Altura: "
	str5: .asciiz "Área: "
	
.text
																# opções:
																# $zero:   círculo
	ori $t6, $zero, 1							# 1: 			 triângulo
	ori $t7, $zero, 2							# 2:       retângulo

	li $v0, 4 										# imprime str1
	la $a0, str1									# (escolhas)
	syscall
	
	li $v0, 5											# lê opção
	syscall
	
	move $t0, $v0

	beq $t0, $zero, raio					# if (op == 0) lerRaio()
	j baseAltura									# else lerBaseAltura()
	
		
raio:
	li $v0, 4 										# imprime str2
	la $a0, str2 									# Raio:
	syscall
	
	li $v0, 5											# lê raio (r)
	syscall
	
	move $a0, $v0									# move para $a0 (argumento da subrotina)
	
	jal areaCirculo								# areaCirculo(r)
	j exit
	

baseAltura:
	li $v0, 4 										# imprime str3
	la $a0, str3									# Base:
	syscall
	
	li $v0, 5											# lê base (a)
	syscall
	
	move $t2, $v0									# coloca a em $t2 para poder utilizar
																#	$a0 para ler prox. parâmetro
	
	li $v0, 4 										# imprime str4
	la $a0, str4									# Altura:
	syscall
	
	li $v0, 5											# lê altura (b)
	syscall

	move $a0, $t2									# move para $a0 e $a1
	move $a1, $v0									# (argumentos das subrotinas)
	
	beq $t0, $t6, triangulo				# if (op == 1) areaTriangulo(a, b)
	beq $t0, $t7, retangulo				# else if (op == 2) areaRetangulo(a, b)
	
	triangulo:
		jal areaTriangulo
		j exit
		
	retangulo:
		jal areaRetangulo
		j exit
	
	
areaCirculo:
	# carrega parâmetros
	move $t0, $a0
	
	ori $t2, $zero, 3							# valor de PI
	mult $t0, $t0									#
	mflo $t0											#	r2 <- r * r
																#
	mult $t0, $t2									#
	mflo $t0											# a <- r2 * PI
	
	jr $ra

areaTriangulo:
	# carrega parâmetros
	move $t0, $a0
	move $t1, $a1
	
	mult $t0, $t1									# a <- b * a
	mflo $t0											#
																# 
	srl $t0, $t0, 1								# a <- a >> 1
	
	jr $ra
	
areaRetangulo:
	# carrega parâmetros
	move $t0, $a0
	move $t1, $a1
	
	mult $t0, $t1									# a <- b * a
	mflo $t0
	
	jr $ra

exit:
	li $v0, 4 										# imprime str5
	la $a0, str5									# Área:
	syscall
	
	li $v0, 1											# imprime a área
	la $a0, ($t0)									# (registrador $t0)
	syscall
	
	li $v0, 10										# encerra programa
	syscall