.data
_save: .word ...
_k: .word 6	
#_error:.asciiz "Index Out of Bounds Exception"
.text
.globl main
main: # inicialização
la $s6, _save  
lw $s5, _k
add $s3, $zero, $zero
lw $t2, 8($s6)

Loop: # corpo do laço
#sltu $t9, $s3, $t2
#beq $t9, $zero, IndexOutOfBounds

sll $t1, $s3, 2    #s3 = i
add $t1, $t1, $s6  #s6 é o base do array
lw $t0, 0($t1) 
bne $t0, $s5, Exit    #s5 é o k
addi $s3, $s3, 1      
j Loop
                
Exit: # rotina para imprimir inteiro no console
addi $v0, $zero, 1
add $a0, $zero, $s3
syscall     
#j End

#IndexOutOfBounds:
#addi $v0, $zero, 4
#la $a0, _error
#syscall
#End: