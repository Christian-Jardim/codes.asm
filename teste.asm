.main:
    # Initialize sum1 to 0
    li      $t0, 0          # $t0 will store sum1, initialize to 0
    
    # Set up loop variables
    li      $t1, 0          # $t1 is i, initialize to 0
    li      $t2, 0          # $t2 is j, initialize to 0
    li      $t3, 10000      # $t3 is N, constant value 10000
    
loop_i:
    # Compare i with N (10000)
    bge     $t1, $t3, end_loop_i  # if i >= N, exit outer loop
    
    # Reset j to 0 for each new i
    li      $t2, 0          # $t2 = j = 0
    
loop_j:
    # Compare j with N (10000)
    bge     $t2, $t3, end_loop_j  # if j >= N, exit inner loop
    
    # Calculate the address of matrix[i][j]
    mul     $t4, $t1, 10000       # $t4 = i * N (this gives the row offset)
    add     $t4, $t4, $t2         # $t4 = i * N + j (this gives the column offset)
    sll     $t4, $t4, 2           # $t4 = (i * N + j) * 4 (to account for 4 bytes per element)
    la      $t5, matrix           # Load base address of matrix into $t5
    add     $t6, $t5, $t4         # $t6 = address of matrix[i][j]
    lw      $t7, 0($t6)           # Load matrix[i][j] into $t7
    
    # Add matrix[i][j] to sum1
    add     $t0, $t0, $t7         # sum1 += matrix[i][j]
    
    # Increment j
    addi    $t2, $t2, 1           # j++
    j       loop_j                # Jump to the next iteration of the inner loop

end_loop_j:
    # Increment i
    addi    $t1, $t1, 1           # i++
    j       loop_i                # Jump to the next iteration of the outer loop

end_loop_i:
    # Now, sum1 is in $t0, you can store it or use it
    # Example: store sum1 at some memory location (if desired)
    # sw      $t0, sum1_location   # Uncomment and define sum1_location if needed
    
    # Exit program (terminate)
    li      $v0, 10               # syscall for exit
    syscall
