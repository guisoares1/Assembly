# Module Name: pc3-guilherme-soares
# Função: Conjectura de Collatz
# Nome: Guilherme Soares Correa
# Matricula: 11821BCC026
# Inicio: 16/09/2019
# FIm: 16/09/2019
# Linguagem: Assembly MIPS
.data
     	num1: .asciiz "Escreva um número: " 
     	Resu: .asciiz "Resultado é: "
        Space: .asciiz " "

.text 
   	li $v0,4     #mostrando que vou mostrar uma string (o número 4)
   	la $a0,num1  #mostrando a string
   	syscall      #do
   	
   	li $v0,5     #Lendo o primeiro número
   	syscall      #do
   	
 	move $t1, $v0 #movendo para variável "global" 
   	
   	li $v0,4     #mostrando que vou mostrar uma string (o número 4)
   	la $a0,Resu  #mostrando a string 
        syscall      #do 	
        
           
        li $t5,2     #definindo o 2 para divisao
        div $t1,$t5  #dividindo     
        mfhi $s1     #guarando resto em s1
        
        move $a0, $t1#mostrando o q irá aparecer na tela
        li $v0, 1    #mostrando
        syscall      #do
        
        li $v0, 4    #tratamento para o espaço
        la $a0, Space
        syscall  
          
        beq $s1,1,Imp #caso seja impar chama a label que trata o numero
        beq $s1,0,Par #caso seja par chama a label que trata o numero
 
 loop:
     li $v0,4     #mostrando que vou mostrar um número (código 1)
     la $a0,Space #indicando onde está o resto a ser mostrado (em t2)
     syscall      #do
    
     beq $t1,1,End #Parada
     
     li $t5,2
     div $t1,$t5  #dividindo     
     mfhi $s1     #guarando resti em s1
     beq $s1,1,Imp#caso seja impar chama a label que trata o numero
     beq $s1,0,Par#caso seja par chama a label que trata o numero
 
 Par: 
    li $t5,2     #definindo o 2 para divisao
    div $t1,$t5  #dividindo
    mflo $t0     #guarando divisão em s2 
    move $a0,$t0 #indicando onde está o resto a ser mostrado (em t2) 
    li $v0,1     #mostrando que vou mostrar um número (código 1)
    syscall      #do
    move $t1,$t0 #guardando na variável "global"
    j loop
    
 Imp:  
    mulo $t1,$t1,3 #multiplicando
    add $t1 , $t1, 1 #somando 1
    move $a0,$t1 #indicando onde está o resto a ser mostrado (em t2) 
    li $v0,1     #mostrando que vou mostrar um número (código 1)
    syscall      #do
    j loop
  
 
 End: 	
     li $v0, 10   # Fim do programa
     syscall      #do
