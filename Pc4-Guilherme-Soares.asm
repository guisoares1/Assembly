# Module Name: pc4-guilherme-soares
# Fun��o: Calcular os digitos verificadores do CPF
# Nome: Guilherme Soares Correa
# Matricula: 11821BCC026
# Inicio: 22/09/2019
# FIm: 23/09/2019
# Linguagem: Assembly MIPS
.data
     	Vet:    .word 0,0,0,0,0,0,0,0,0,0,0         #V[11]
     	num1: .asciiz "Escreva um n�mero: \n"
        traco: .asciiz "-"

.text 
        li $t2,0    #endere�amento (leitura)
        li $t6,2    #mult (primeiro)
        li $t7,0    #endere�amento (primeira conta)
        li $t1,0    #guarda multplica��o 
        li $t8,2    #mult (segundo)
        li $t9,0    #endere�amento (segunda conta)
        li $t1,0    #guarda multplica��o
        li $t5,0    #endere�amento (mostrar)
#################################################################
 Leitura:
        beq $t2,36,Primeiro
   	li $v0,4     #mostrando que vou mostrar uma string (o n�mero 4)
   	la $a0,num1  #mostrando a string
   	syscall      #do
   	
   	li $v0,5     #Lendo o primeiro n�mero
   	syscall      #do
   	
   	move $t3, $v0   #pegando valor digitando
        sw   $t3, Vet($t2)#atribuindo valor para a posi��o do vetor v[cont]
        addi $t2,$t2,4  #incrementando o endereco do vetor 
        j Leitura
#################################################################   
# Obs: Por algum motivo que ainda n�o consegui entender, n�o estou conseguindo mudar o valor do vetor (linha 45 e 64), sendo assim os dois digitos n�o est�o indo no vetor. 
# Tendo isso, no final eu mostrei as duas vari�veis globais criadas: $t3 e $t1, com os dois digitos      
Primeiro: 
      beq  $t7,0,SomaP 
      mulo $t0,$t0,10  #multiplicando
      li $s5,11 
      div $t0,$s5      #dividindo     
      mfhi $a1         #guarando resto    
      move $t3, $a1
      sw   $t3, Vet($t2)#atribuindo valor para a posi��o do vetor v[cont]
      addi $t2,$t2,4   #incrementando o endereco do vetor   
      beq  $t2,40,Segundo
     j Primeiro    
SomaP: 
     lw   $a1,Vet($t7)#atribuindo valor para a posi��o do vetor v[cont]
     mulo $a2,$t6,$a1 #multiplicando 
     add  $t0,$t0,$a2 
     addi $t7,$t7,4  #incrementando o endereco do vetor 
     addi $t6,$t6,1  #incrementando o valor a ser multiplicado
     beq $t7,36,Primeiro
#################################################################   
Segundo:
      beq  $t9,0,SomaS 
      mulo $t1,$t1,10 #multiplicando 
      li $s5,11 
      div $t1,$s5  #dividindo     
      mfhi $a1     #guarando resto
      move $t1, $a1
      sw   $t1,Vet($t9)#atribuindo valor para a posi��o do vetor v[cont]
      addi $t2,$t2,4  #incrementando o endereco do vetor
      beq  $t2,44,Imp 
     j Segundo    
SomaS: 
     lw   $a1,Vet($t9)#atribuindo valor para a posi��o do vetor v[cont]
     mulo $a2,$t8,$a1 #multiplicando 
     add  $t1,$t1,$a2 
     addi $t9,$t9,4  #incrementando o endereco do vetor 
     addi $t8,$t8,1  #incrementando o endereco do vetor
     beq $t9,40,Segundo                              
#################################################################       
Imp:
   beq $t5,44,End
   beq $t5,36,Traco
   lw $a1,Vet($t5) 
   move $a0,$a1
   li $v0,1     #mostrando que vou mostrar um n�mero (c�digo 1)
   syscall      #do
   addi $t5,$t5,4  #incrementando o endereco do vetor 
   j Imp
       
 Traco:
     li $v0,4     #mostrando que vou mostrar um n�mero (c�digo 1)
     la $a0,traco #indicando onde est� o resto a ser mostrado (em t2)
     syscall      #do
     j dig1
dig1:
     #lw $a1,Vet($t5) #pegando conteudo do vetor
     move $a0,$t3    #jogando na vari�vel que ir� ser apresentada na tela
     li $v0,1     #mostrando que vou mostrar um n�mero (c�digo 1)
     syscall      #do
     addi $t5,$t5,4  #incrementando o endereco do vetor 
     j dig2
dig2:
     #lw $a1,Vet($t5) #pegando conteudo do vetor
     move $a0,$t1    #jogando na vari�vel que ir� ser apresentada na tela
     li $v0,1     #mostrando que vou mostrar um n�mero (c�digo 1)
     syscall      #do 
     j End
 #################################################################      
 End: 	
     li $v0, 10   # Fim do programa
     syscall      #do
