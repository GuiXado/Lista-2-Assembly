#1.Elaborar um programa que apresente o valor da conversão em real (R$) de um valor lido em
#dólar (US$). O programa deve considerar a cotação do dólar em R$5 (Usar apenas números inteiros).
.data
	d: .asciiz "Digite o valor em dolar: "
	r: .asciiz "O valor em reais é: "
.text
main:
	li $v0, 4
	la $a0, d
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, 0
	
	mul $s0, $s1, 5
	
	li $v0, 4
	la $a0, r
	syscall
	li $v0, 1
	add $a0, $s0, 0
	syscall	