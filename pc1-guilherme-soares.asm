# Module Name: pc2-guilherme-soares
# Fun��o: Somar dois n�meros
# Nome: Guilherme Soares Correa
# Matricula: 11821BCC026
# Inicio: 09/09/2019
# FIm: 09/09/2019
# Linguagem: Assembly MIPS
.data
     	num1: .asciiz "Escreva um n�mero: " 
     	num2: .asciiz "Escreva outro n�mero: "
     	Resu: .asciiz "Resultado �: "

.text 
   	li $v0,4     #mostrando que vou mostrar uma string (o n�mero 4)
   	la $a0,num1  #mostrando a string
   	syscall      #do
   	
   	li $v0,5     #Lendo o primeiro n�mero
   	syscall      #do
   	
   	move $t0, $v0 #guardando o valor da variavel v0 (lida anteriormente) em t0
   	
   	li $v0,4     #mostrando que vou mostrar uma string (o n�mero 4)
   	la $a0,num2  #mostrando a string
   	syscall      #do
   	
   	li $v0,5     #Lendo o segundo n�mero
   	syscall      #do
   	
   	move $t1, $v0 #guardando o valor da variavel v0 (lida anteriormente) em t1 
   	
   	add $t2 , $t0, $t1 #somando os dois valores t0 e t1
   	
   	li $v0,4     #mostrando que vou mostrar uma string (o n�mero 4)
   	la $a0,Resu  #mostrando a string
   	syscall      #do
   	
   	li $v0,1     #mostrando que vou mostrar um n�mero (c�digo 1)
   	move $a0,$t2 #indicando onde est� o n�mero a ser mostrado (em t2) 
   	syscall      #do
   	
   	li $v0, 10   # Fim do programa
   	syscall      #do