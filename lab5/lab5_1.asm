# Estímulos: v[] = [9, 8, 7, 6, 5, 4, 3, 2, 1,-1] e k = 2
.data
_v: .word 9,8,7,6,5,4,3,2,1,-1
_k: .word 2
.text
.globl main
main:
# Inicialização do parâmetros
la $a0, _v
lw $a1, _k
jal swap # Chamada do procedimento
li $v0, 10 # Exit syscall
syscall
# Corpo do procedimento
swap:
sll $t0, $a1, 2 #mult by 4 
add $t9, $t0, $a0 # soma base + deslocamento
lw $t1, 0($t9) # carregar os valores
lw $t2, 4($t9)
sw $t1, 4($t9) # reescrever valores
sw $t2, 0($t9)
jr $ra # retorno ao programa principal
##################Responder ao 1.1