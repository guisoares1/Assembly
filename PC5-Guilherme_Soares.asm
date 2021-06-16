# Module Name: pc5-guilherme-soares
# Fun??o: Exercitar passagem de parametros via pilha
# Nome: Guilherme Soares Correa
# Matricula: 11821BCC026
# Inicio: 10/11/2019
# Fim: 11/11/2019
# Revisado: 14/11/2019
# Linguagem: Assembly MIPS
.data
     txt:  .asciiz "------- Tela -----\n Entre os coeficientes da equacao: \n ax2+bx+c = 0 \n"
     num1: .asciiz "a = "
     num2: .asciiz "b = "
     num3: .asciiz "c = "
     traco: .asciiz "-"
     zero:  .asciiz "Delta zero, favor verificar equacao."
     Mzero: .asciiz "Delta negativo, favor verificar equacao."
     x1:    .asciiz "\nX1: "
     x2:    .asciiz "\nX2: "
     que:   .asciiz "\n"
.text 
#################################################################
 Leitura:
   	li $v0,4     #mostrando que vou mostrar uma string (o n?mero 4)
   	la $a0,txt   #mostrando a string
   	syscall      #do
   	
   	li $v0,4     #mostrando que vou mostrar uma string (o n?mero 4)
   	la $a0,num1  #Showing
   	syscall      #do
   	
   	li $v0,5     #Reading a
   	syscall      #do
   	
   	move $t0, $v0#Saving digited number
         	
   	li $v0,4     #mostrando que vou mostrar uma string (o n?mero 4)
   	la $a0,num2  #mostrando a string
   	syscall      #do
   	
   	li $v0,5     #Reading b
   	syscall      #do
   	
   	move $t1, $v0#Saving digited number
   	
   	li $v0,4     #mostrando que vou mostrar uma string (o n?mero 4)
   	la $a0,num3  #mostrando a string
   	syscall      #do
   	
   	li $v0,5     #Reading c
   	syscall      #do
   	
   	move $t2, $v0#Saving digited number
   	
# putting numbers on Stack  	
   	addi $sp, $sp, -4  # Decrement stack pointer by 4  
        sw   $t0, ($sp)    # Save A to stack
        
        addi $sp, $sp, -4  # Decrement stack pointer by 4  
        sw   $t1, ($sp)    # Save B to stack 
        
        addi $sp, $sp, -4  # Decrement stack pointer by 4  
        sw   $t2, ($sp)    # Save C to stack
   	
   	jal Delta          # jump to $ra
   	
   	j End
#################################################################    	
Delta: 
        lw   $t0, ($sp)    # Copy from stack to C  
        addi $sp, $sp, 4   # Increment stack pointer by 4
       
        lw   $t1, ($sp)    # Copy from stack to B  
        addi $sp, $sp, 4   # Increment stack pointer by 4
       
        lw   $t2, ($sp)    # Copy from stack to A  
        addi $sp, $sp, 4   # Increment stack pointer by 4
        
       
        mulo $s1,$t0,$t2   #multiplicando a*c
        mulo $s1,$s1,4     #multiplicando (a*c)*4
        mulo $s2,$t1,$t1   # b * b
        sub  $t3,$s2,$s1   #Delta

                           
        beq $t3,$zero,Tzero
        blt $t3,$zero,TmenZer 
       	
        addi $sp, $sp, -4  # Decrement stack pointer by 4  
        sw   $t0, ($sp)    # Save C to stack
        
        addi $sp, $sp, -4  # Decrement stack pointer by 4  
        sw   $t1, ($sp)    # Save B to stack 
        
        addi $sp, $sp, -4  # Decrement stack pointer by 4  
        sw   $t2, ($sp)    # Save A to stack
        
        addi $sp, $sp, -4  # Decrement stack pointer by 4  (DELTAAAAAAAAAAAAAA)
        sw   $t3, ($sp)    # Save Delta to stackdo
        
        li $t4, 1
        li $t5, 0 
        bgt $t3, $zero, Sqr # Jumping to Sqr     
        jr $ra            # Like Return
#################################################################        
Tzero:
       li $v0,4     #mostrando que vou mostrar uma string (o n?mero 4)
       la $a0,zero  #Showing
       syscall      #do
       jr $ra       # Like Return 
#################################################################       
TmenZer:
       li $v0,4     #mostrando que vou mostrar uma string (o n?mero 4)
       la $a0,Mzero #Showing
       syscall      #do
       jr $ra       # Like Return
#################################################################
Sqr:
       sub $t3, $t3, $t4          # subtracting $t3 by $t4 and storing in $t3
       add $t4, $t4, 2            # only the odd values Im = 2x+1
       add $t5, $t5, 1            # updating counter
       beqz $t3, Bask             # branch to Bask if the number in $t3 is 0
       blt $t3, 0, Tzero          # brach to Tzero if $t3 is less than 0  
       j Sqr                      # Recursion 
#################################################################
Bask:
        lw   $t0, ($sp)    # Copy from stack to Delta  
        addi $sp, $sp, 4   # Increment stack pointer by 4
       
        lw   $t1, ($sp)    # Copy from stack to A  
        addi $sp, $sp, 4   # Increment stack pointer by 4
       
        lw   $t2, ($sp)    # Copy from stack to B  
        addi $sp, $sp, 4   # Increment stack pointer by 4
        
        lw   $t3, ($sp)    # Copy from stack to C  
        addi $sp, $sp, 4   # Increment stack pointer by 4
                 
        mulo $t2, $t2, -1  # changing signal of $t1 registrator
        add $t8, $t2, $t5  # receive the divider after adding the two values
             
        sub $t9, $t2, $t5  # receive the divider after adding the two values
        mulo $t6, $t1, 2   # making the multiplication of (2 * a)
        
        div $t8, $t6       # making the division to discover the first root
        mflo $t0           # receive the quotient of divison
        div $t9, $t6       # making the division to discover the second root
        mflo $t1           # receive the quotient of divison
            
        li $v0,4     
   	la $a0,x1     #Showing
   	syscall      #do
        
        move $a0,$t1    
        li $v0,1        #Showing X1
        syscall         #do 
              
        li $v0,4     
   	la $a0,x2    #Showing
   	syscall      #do
        
        move $a0,$t0    
        li $v0,1     #Showing X2
        syscall      #do 
                  
        jr $ra

#################################################################      
 End: 	
     li $v0, 10   # Fim do programa
     syscall      #do
