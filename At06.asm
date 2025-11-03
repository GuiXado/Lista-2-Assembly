#6.Escreva um programa que pergunte dois números e indique se são iguais ou diferentes. Caso
#sejam diferentes, mostre o maior e o menor (nesta ordem).
.data
	n: .asciiz "Digite um número: "
	i: .asciiz "\nAmbos os números são iguais!\n"
	dv: .asciiz "\nA divisão do maior pelo menor é: "
	
.text
main:
	li $v0, 4
	la $a0, n
	syscall
	li $v0, 5
	syscall
	add $s1, $v0, 0
	
	li $v0, 4
	la $a0, n
	syscall
	li $v0, 5
	syscall
	add $s2, $v0, 0
	
	beq $s1, $s2, iguais
	bgt $s1, $s2, umMaior
	j segMaior
	
iguais:
	li $v0, 4
	la $a0, i
	syscall
	j fim
umMaior:
	div $s0, $s1, $s2

	li $v0, 4
	la $a0, dv
	syscall
	li $v0, 1
	add $a0, $s0, 0
	syscall
	j fim
segMaior:
	div $s0, $s2, $s1

	li $v0, 4
	la $a0, dv
	syscall
	li $v0, 1
	add $a0, $s0, 0
	syscall
		
fim: