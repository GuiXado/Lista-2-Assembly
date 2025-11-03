#4.O proprietário da empresa ABC LTDA precisa de um programa de computador para calcular o
#novo salário que seus funcionários irão receber a partir do mês que vem. Sabendo que o
#aumento de salário para todos os funcionários será de 25%, faça um programa que lê o valor do
#salário atual do funcionário e informa o seu novo salário acrescido de 25% (Por se tratar de
#apenas número inteiros, para calcular 25% deve-se multiplicar o valor por 25 e dividir por 100).
.data
	s: .asciiz "Qual o salário atual do funcionario: "
	r: .asciiz "O salário com 25% de acrescimo é: "
.text
main:
	li $v0, 4
	la $a0, s
	syscall
	li $v0, 5
	syscall
	add $s0, $v0, 0
	
	mul $s1, $s0, 25
	div $s1, $s1, 100
	add $s0, $s0, $s1
	
	li $v0, 4
	la $a0, r
	syscall
	li $v0, 1
	add $a0, $s0, 0
	syscall