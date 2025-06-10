main:   li      $t1, 100                # N = 100
        mul     $t2, $t1, $t1           # Tamanho da matriz[N][N]       

        li      $t0, 0x0                # Endereço base da matriz 
        addi    $t3, $zero, 0           # contador = 0
        addi    $t6, $zero, 0           # sum = 0
        addi    $t8, $zero, 4         

loop:   mul     $t4, $t3, $t8          
        add     $t4, $t0, $t4          
        lw      $t5, 0($t4)
        add     $t6, $t6, $t5
        beq     $t3, $t2, end           # Se contador == tamnho da matriz, finaliza
        addi    $t3, $t3, 1             # i++
        j       loop                    # Continua programa

end:    li      $v0, 10                 # Encerra programa
        syscall
