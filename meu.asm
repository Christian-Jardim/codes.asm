.main:
    li      $t0, 0                       #sum1
    li      $t1, 0          # $t1 is i, initialize to 0
    li      $t2, 0          # $t2 is j, initialize to 0
    li      $t3, 10000      # $t3 is N, constant value 10000
    li      $t8, 0x00000000

loop_i:
    beq     $t1, $t3, end_loop_i  # if i >= N, exit outer loop
    li      $t2, 0          # $t2 = j = 0
    
loop_j:
    beq     $t2, $t3, end_loop_j  # if j >= N, exit inner loop
    
    lw 
    #mul     $t4, $t1, $t3       # $t4 = i * N (this gives the row offset)
    #add     $t4, $t4, $t2         # $t4 = i * N + j (this gives the column offset)
    #sll     $t4, $t4, 2           # $t4 = (i * N + j) * 4 (to account for 4 bytes per element)
    #add      $t5, $t8, $zero           # Load base address of matrix into $t5
    #add     $t6, $t5, $t4         # $t6 = address of matrix[i][j]
    #lw      $t7, 0($t6)           # Load matrix[i][j] into $t7
    
    add     $t0, $t0, $t7         # sum1 += matrix[i][j]
    
    addi    $t2, $t2, 1           # j++
    j       loop_j                # Jump to the next iteration of the inner loop

end_loop_j:
    addi    $t1, $t1, 1           # i++
    j       loop_i                # Jump to the next iteration of the outer loop

end_loop_i:
    li      $v0, 10               # syscall for exit
    syscall
