# Module Name: pc2-guilherme-soares
# Fun��o: Divide dois n�meros
# Nome: Guilherme Soares Correa
# Matricula: 11821BCC026
# Inicio: 09/09/2019
# FIm: 09/09/2019
# Linguagem: Assembly MIPS
.data
     	num1: .asciiz "Escreva um n�mero: " 
     	num2: .asciiz "Escreva outro n�mero: "
     	Resu: .asciiz "Divis�o: "
     	rest: .asciiz "\nResto:" 

.text 
   	li $v0,4     #mostrando que vou mostrar uma string (o n�mero 4)
   	la $a0,num1  #mostrando a string
   	syscall      #do
   	
   	li $v0,5     #Lendo o primeiro n�mero
   	syscall      #do
   	
   	move $t0, $v0 #guardando o valor da variavel v0 (lida anteriormente) em t0
#--------------------------------------------------------------------------------------- 	
   	li $v0,4     #mostrando que vou mostrar uma string (o n�mero 4)
   	la $a0,num2  #mostrando a string
   	syscall      #do
   	
   	li $v0,5     #Lendo o segundo n�mero
   	syscall      #do
   	
   	move $t1, $v0 #guardando o valor da variavel v0 (lida anteriormente) em t1 
#---------------------------------------------------------------------------------------  	
   	div $t0, $t1 #dividindo 
   	mflo $s2     #guarando divis�o em s2
   	mfhi $s1     #guarando resti em s1
#---------------------------------------------------------------------------------------   	
   	li $v0,4     #mostrando que vou mostrar uma string (o n�mero 4)
   	la $a0,Resu  #mostrando a string
   	syscall      #do
   	
   	li $v0,1     #mostrando que vou mostrar um n�mero (c�digo 1)
   	move $a0,$s2 #indicando onde est� a divis�o a ser mostrado (em s2) 
   	syscall      #do
#---------------------------------------------------------------------------------------	
   	li $v0,4     #mostrando que vou mostrar uma string (o n�mero 4)
   	la $a0,rest  #mostrando a string
   	syscall      #do
   	
   	li $v0,1     #mostrando que vou mostrar um n�mero (c�digo 1)
   	move $a0,$s1 #indicando onde est� o resto a ser mostrado (em t2) 
   	syscall      #do
   	
#--------------------------------------------------------------------------------------- 		
   	li $v0, 10   # Fim do programa
   	syscall      #do
