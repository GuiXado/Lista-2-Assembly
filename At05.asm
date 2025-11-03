#5.Escreva um programa que pergunte os coeficientes de uma equação de segundo grau (A, B e C) e:
#a) se DELTA for maior que zero: imprima “DUAS RAÍZES REAIS”;
#b) se DELTA for igual a zero: imprima apenas “UMA RAÍZ REAL”;
#c) se DELTA menor que zero: imprima a mensagem “NÃO EXISTEM RAÍZES REAIS”.
#(Não é necessário calcular as raízes caso existam).
.data
	a: .asciiz "Digite o valor de A: "
	b: .asciiz "Digite o valor de B: "
	c: .asciiz "Digite o valor de C: "
	d: .asciiz "\nDUAS RAÍZES REAIS\n"
	u: .asciiz "\nUMA RAÍZES REAIS\n"
	n: .asciiz "\nNÃO EXISTEM RAÍZES REAIS\n"
.text
main:
	li $v0, 4
	la $a0, a
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, 0
	
	li $v0, 4
	la $a0, b
	syscall
	li $v0, 5
	syscall
	add $s2, $v0, 0
	
	li $v0, 4
	la $a0, c
	syscall
	li $v0, 5
	syscall
	add $s3, $v0, 0
	
	# delta = B * B - 4 * A * C

	# s1 = A / s2 = B / s3 = C 
	mul $s2, $s2, $s2 # B * B
	mul $s1, $s1, 4 # 4 * A
	mul $s1, $s1, $s3 # (4 * A) * C
	sub $s0, $s2, $s1 # (b*b) - (4 * a * c)
	
	beq $s0, 0, uma
	blt $s0, 0, nao
	bgt $s0, 0, duas
	
uma:
	li $v0, 4
	la $a0, u
	syscall
	j fim
duas:
	li $v0, 4
	la $a0, d
	syscall
	j fim
nao:
	li $v0, 4
	la $a0, n
	syscall

fim: