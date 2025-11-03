#2.Ler dois valores para 2 registradores e efetuar a troca dos valores de forma que o valor do
#primeiro registrador passe ao segundo e o segundo passe ao primeiro. Apresentar os valores
#após a efetivação do processamento da troca.
.data
	p: .asciiz "Digite o primero valor: "
	s: .asciiz "Digite o segundo valor: "
	ps: .asciiz "O primeiro valor passou a ser: "
	sp: .asciiz "\nO segundo valor passou a ser: "
.text
main:
	li $v0, 4
	la $a0, p
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, 0
	
	li $v0, 4
	la $a0, s
	syscall
	li $v0, 5
	syscall
	add $s2, $v0, 0
	
	add $s3, $s2, 0
	add $s2, $s1, 0
	add $s1, $s3, 0
	
	li $v0, 4
	la $a0, ps
	syscall
	li $v0, 1
	add $a0, $s1, 0
	syscall
	
	li $v0, 4
	la $a0, sp
	syscall
	li $v0, 1
	add $a0, $s2, 0
	syscall