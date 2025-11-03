#8.Escreva um algoritmo que leia (em números inteiros) o valor da compra de um produto da Loja
#Vende Tudo. A loja só vende produtos de valor entre R$1000.00 e R$9999.99 (Que deve ser
#validado na entrada). A loja permite pagar o valor em parcelas fixas. O algoritmo deve ler
#também o valor da parcela a ser paga, que deve ser um valor entre R$100.00 e R$500.00 (Que
#deve ser validado na entrada). O algoritmo, sabendo que a última parcela pode ser de valor
#inferior às anteriores, deve calcular quantas parcelas serão pagas.
.data
	v: .asciiz "Digite o valor da compra: "
	p: .asciiz "\nEsse valor pode ser parcelado em, "
	de: .asciiz " vezes de R$"
	di: .asciiz ". Tendo uma diferença de R$"
.text
main:
	li $v0, 4
	la $a0, v
	syscall
	li $v0, 5
	syscall
	add $s0, $v0, 0
	
	blt $s0, 1000, main
	bgt $s0, 10000, main
	
	li $t1, 1
valor:
	div $s1, $s0, $t1
	blt $s1, 500, conta
	add $t1, $t1, 1
	j valor
	
conta:
	mul $s2, $s1, $t1
	sub $s2, $s0, $s2
	
parcela:
	
	li $v0, 4
	la $a0, p
	syscall
	li $v0, 1
	add $a0, $t1, 0
	syscall
	
	li $v0, 4
	la $a0, de
	syscall
	li $v0, 1
	add $a0, $s1, 0
	syscall
	
	li $v0, 4
	la $a0, di
	syscall
	li $v0, 1
	add $a0, $s2, 0
	syscall