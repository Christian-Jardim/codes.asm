main:   
addi    $t1, $zero, 100       # N = 100       
addi    $t2, $zero, 0         # j = 0
addi    $t0, $zero, 0x0       # endereço base (matriz) = 0      
addi    $t3, $zero, 0         # i = 0
addi    $t6, $zero, 0         # sum = 0
addi    $t8, $zero, 4         # base = 4

loop:
beq     $t3, $t1, end         # se i = 100, finaliza o programa
beq     $t2, $t1, loop_i      # se j = 0, vai para o loop_i
mul     $t4, $t1, $t8         # $t4 = N * base
mul     $t4, $t4, $t2         # $t4 = $t4 * j
mul     $t7, $t3, $t8         # $t7 = i * base
add     $t4, $t4, $t7         # Calculo do deslocamento
add     $t4, $t4, $t0         # endereço do dado = deslocamento + endereço base (matriz)
lw        $t5, 0($t4)         # Carrega o valor do indereço para $t5  
add     $t6, $t6, $t5         # sum = sum + $t5
addi    $t2, $t2, 1           # j = j +  1
j       loop                  # Vai para o loop

loop_i: 
beq $t3, $t1, end             # se i = 100, finaliza o programa
addi $t3, $t3, 1              # i = i + 1
li $t2, 0                     # j = 0
j loop                        # Vai para o loop

end:    
li      $v0, 10               # Finaliza o programa
syscall
