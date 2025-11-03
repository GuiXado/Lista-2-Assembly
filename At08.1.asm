#8.Escreva um algoritmo que leia (em números inteiros) o valor da compra de um produto da Loja
#Vende Tudo. A loja só vende produtos de valor entre R$1000.00 e R$9999.99 (Que deve ser
#validado na entrada). A loja permite pagar o valor em parcelas fixas. O algoritmo deve ler
#também o valor da parcela a ser paga, que deve ser um valor entre R$100.00 e R$500.00 (Que
#deve ser validado na entrada). O algoritmo, sabendo que a última parcela pode ser de valor
#inferior às anteriores, deve calcular quantas parcelas serão pagas.
.data
	v: .asciiz "Digite o valor da compra: "
	p: .asciiz "Digite o valor da parcela: "
	q: .asciiz "\nA quandidade de parcelas é de: "
	s: .asciiz ". Sendo "
	dd: .asciiz " parcelas fixas de R$"
	u: .asciiz " e uma última de R$"
.text
main:
	li $v0, 4
	la $a0, v
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, 0
	
	blt $s1, 1000, main
	bgt $s1, 10000, main
parcela:
	
	li $v0, 4
	la $a0, p
	syscall
	li $v0, 5
	syscall
	add $s2, $v0, 0
	
	blt $s2, 100, parcela
	bgt $s2, 500, parcela
	
	div $s0, $s1, $s2
	rem $s3, $s1, $s2
	beq $s3, 0, PARCELA
	add $s0, $s0, 1
	
	
	li $v0, 4
	la $a0, q
	syscall
	li $v0, 1
	add $a0, $s0, 0
	syscall
	
	li $v0, 4
	la $a0, s
	syscall
	sub $s0, $s0, 1
	li $v0, 1
	add $a0, $s0, 0
	syscall
	
	li $v0, 4
	la $a0, dd
	syscall
	li $v0, 1
	add $a0, $s2, 0
	syscall
	
	li $v0, 4
	la $a0, u
	syscall
	li $v0, 1
	add $a0, $s3, 0
	syscall
	
PARCELA:
	li $v0, 4 
	la $a0, q
	syscall
	li $v0, 1
	add $a0, $s0, 0
	syscall