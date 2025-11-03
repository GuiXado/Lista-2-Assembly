#3. Crie um programa que lê o mês e o ano de nascimento de uma pessoa e o mês e ano atual.
#Calcule e mostre qual é: a idade da pessoa em meses.
.data
	aa: .asciiz "Digite o ano atual (quatro digitos): "
	mm: .asciiz "Digite o mês atual: "
	adp: .asciiz "Digite seu ano de nascimento (quatro digitos): "
	mdp: .asciiz "Digite seu mês de nascimento: "
	r: .asciiz "A idade em meses é: "
.text
main:
	li $v0, 4
	la $a0, mm
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, 0 # s1 = mês atual
	
	li $v0, 4
	la $a0, aa
	syscall
	li $v0, 5
	syscall
	add $s2, $v0, 0 # s2 = ano atual
	
	li $v0, 4
	la $a0, mdp
	syscall
	li $v0, 5
	syscall
	add $s3, $v0, 0 # s3 = mês nascimento
	
	li $v0, 4
	la $a0, adp
	syscall
	li $v0, 5
	syscall
	add $s4, $v0, 0 # s4 = ano nascimento
	
	sub $s6, $s2, $s4 #subtrai o ano atual do nascimento (ano)
	sub $s5, $s1, $s3 # s5 = diferença em meses (sendo negativo ou positivo)
	
	blt $s5, 0, ano #como a diferença em meses pode dar negativo pula pro ano
	j fim
	
ano: # a diferença de meses sendo negativo quer dizer que nao completou o aniversario no ano atual
	sub $s6, $s6, 1 #subtrai 1 ano da contagem de anos
	add $s5, $s5, 12 #soma 12 meses ao valor negativo dando os meses corretos

fim:
	mul $s6, $s6, 12
	add $s0, $s5, $s6
	
	li $v0, 4
	la $a0, r
	syscall
	li $v0, 1
	add $a0, $s0, 0
	syscall
	