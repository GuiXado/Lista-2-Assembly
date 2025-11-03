#7.Ler um número inteiro e imprimir a saída da seguinte forma:
#CENTENA = x
#DEZENA = y
#UNIDADE = z
#Exemplo:
#Entrada = 517
#Saída:
#CENTENA = 5
#DEZENA = 1
#UNIDADE = 7
#*Sabe-se que a entrada deve ser um número entre 100 e 999, validar a entrada para que não
#permita números fora deste intervalo
.data
	dg: .asciiz "Digite um número entre 100 e 999: "
	#n: .asciiz "\nNúmero invalido!\n"
	c: .asciiz "\nCentena = "
	d: .asciiz "\nDezena = "
	u: .asciiz "\nUnidade = "
.text
main:
	li $v0, 4
	la $a0, dg
	syscall
	li $v0, 5
	syscall
	add $s0, $v0, 0
	
	blt $s0, 100, main
	bgt $s0, 999, main
		
	li $t1, 1
	li $t2, 1
comeco: # pega o valor e div até o resultador ser menor que 100 (soma 1 no contador / valor da divisão)
	div $s1, $s0, $t1
	blt $s1, 100, centena
	add $t1, $t1, 1
	j comeco

centena: # sub 1 do "contador, dai chega na unidade correta 
	sub $t1, $t1, 1
	
	#pega o resultado anterior multiplica por 100 pra pegar em m valor inteiro e sub do valor inicial
	mul $s5, $t1, 100 
	sub $s5, $s0, $s5
	
dezena:
	# dai tipo n°555. 555 - 500 = 55 dai continua, mesmo esquema do anterior
	div $s2, $s5, $t2
	blt $s2, 10, unidade
	add $t2, $t2, 1
	j dezena

unidade: #basicamente tendo os valores anteriores eu mul por 100 e 10 pra chegar em um valor inteiro (x00) e sub do valor inicial 
	sub $t2, $t2, 1

	mul $s6, $t1, 100
	mul $s7, $t2, 10
	sub $s6, $s0, $s6
	sub $s6, $s6, $s7
	
fim:
	li $v0, 4
	la $a0, c
	syscall
	li $v0, 1
	add $a0, $t1, 0
	syscall
	
	li $v0, 4
	la $a0, d
	syscall
	li $v0, 1
	add $a0, $t2, 0
	syscall
	
	li $v0, 4
	la $a0, u
	syscall
	li $v0, 1
	add $a0, $s6, 0
	syscall