# Module Name: pc2-guilherme-soares
# Função: Divide dois números
# Nome: Guilherme Soares Correa
# Matricula: 11821BCC026
# Inicio: 09/09/2019
# FIm: 09/09/2019
# Linguagem: Assembly MIPS
.data
     	num1: .asciiz "Escreva um número: " 
     	num2: .asciiz "Escreva outro número: "
     	Resu: .asciiz "Divisão: "
     	rest: .asciiz "\nResto:" 

.text 
   	li $v0,4     #mostrando que vou mostrar uma string (o número 4)
   	la $a0,num1  #mostrando a string
   	syscall      #do
   	
   	li $v0,5     #Lendo o primeiro número
   	syscall      #do
   	
   	move $t0, $v0 #guardando o valor da variavel v0 (lida anteriormente) em t0
#--------------------------------------------------------------------------------------- 	
   	li $v0,4     #mostrando que vou mostrar uma string (o número 4)
   	la $a0,num2  #mostrando a string
   	syscall      #do
   	
   	li $v0,5     #Lendo o segundo número
   	syscall      #do
   	
   	move $t1, $v0 #guardando o valor da variavel v0 (lida anteriormente) em t1 
#---------------------------------------------------------------------------------------  	
   	div $t0, $t1 #dividindo 
   	mflo $s2     #guarando divisão em s2
   	mfhi $s1     #guarando resti em s1
#---------------------------------------------------------------------------------------   	
   	li $v0,4     #mostrando que vou mostrar uma string (o número 4)
   	la $a0,Resu  #mostrando a string
   	syscall      #do
   	
   	li $v0,1     #mostrando que vou mostrar um número (código 1)
   	move $a0,$s2 #indicando onde está a divisão a ser mostrado (em s2) 
   	syscall      #do
#---------------------------------------------------------------------------------------	
   	li $v0,4     #mostrando que vou mostrar uma string (o número 4)
   	la $a0,rest  #mostrando a string
   	syscall      #do
   	
   	li $v0,1     #mostrando que vou mostrar um número (código 1)
   	move $a0,$s1 #indicando onde está o resto a ser mostrado (em t2) 
   	syscall      #do
   	
#--------------------------------------------------------------------------------------- 		
   	li $v0, 10   # Fim do programa
   	syscall      #do
