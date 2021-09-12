# Reescreva o seguinte código C em MIPS Assembly:
# int i;
# int vetor[8];
# for(i=0; i<8; i++) {
#   if(i%2==0)
#     vetor[i] = i * 2;
#   else
#     vetor[i] = i + vetor[i-1];
# }
# Cada posição do vetor deve ter 4 bytes e deve ser armazenada, em sequência, a
# partir da posição 0x1001000 da memória.

.data
	vetor: .space 24
	
.text
	lui $t0, 0x1001 # início da memória de dados
	ori $t5, $zero, 7 # tamanho do vetor
	ori $t1, $zero, 2 # pra comparar se par/ímpar
	
	loop:
		
		# testa se $t2 é par
		div $t2, $t1
		mfhi $t3
		beq $t3, $zero, prod
		
		# soma
		add $t4, $t2, $t4
		j store
		
		# produto
		prod:
			sll $t4, $t2, 1 # i * 2
					
		store:
		# armazena resultado na memória
		sw $t4, 0x0($t0)
		
		# incrmenta registrador base para a próxima posição da memória
		addi $t0, $t0, 4
		
		# fim do loop
		beq $t2, $t5, exit
		
		# incrementa contador
		addi $t2, $t2, 1
		
		j loop
	
	exit:
