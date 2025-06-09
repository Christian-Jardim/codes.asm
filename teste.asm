data:
    matrix:  .space 40000  # 100 * 100 * 4 bytes (tamnho da matriz)

main:
    li      $t0, 0          # sum1 = 0 -> $t0
    li      $t1, 0          # i = 0 -> $t1
    li      $t2, 0          # j = 0 -> $t2
    li      $t3, 10000  # N = 10000 -> $t3
    
loop_i:
    beq     $t1, $t3, end_loop_i  # if i == N, encerra o programa
    li      $t2, 0                           # j = 0, reinicializa j em 0
    
loop_j:
    beq     $t2, $t3, end_loop_j  # if j == N, sai do loop de j
    
    mul     $t4, $t1, $t3       # $t4 = i * N (this gives the row offset)
    add     $t4, $t4, $t2         # $t4 = i * N + j (this gives the column offset)
    sll     $t4, $t4, 2           # $t4 = (i * N + j) * 4 (to account for 4 bytes per element)
    la      $t5, matrix           # Load base address of matrix into $t5
    add     $t6, $t5, $t4         # $t6 = address of matrix[i][j]
    lw      $t7, 0($t6)           # Load matrix[i][j] into $t7
    
    add     $t0, $t0, $t7         # sum1 += matrix[i][j]
    
    addi    $t2, $t2, 1           # j++
    j       loop_j                # Jump to the next iteration of the inner loop

end_loop_j:
    addi    $t1, $t1, 1           # i++
    j       loop_i                # Jump to the next iteration of the outer loop

end_loop_i:
    li      $v0, 10               # syscall for exit
    syscall
