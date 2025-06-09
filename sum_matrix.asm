.main:
        addi $t0, $zero, 0        # i = 0
        addi $t1, $zero, 0        # j = 0
        addi $t2, $zero, 0        # sum =0
        addi $t3, $zero, 100      # N = 100
        addi $t4, $zero, 0x0      # Indereço base da matriz

loop_i:
        beq  $t0, $t3, end_i      # if i == 100, end
        addi $t1, $zero, 0        # j = 0

loop_j:
        beq  $t1, $t3, end_j      # if j == 100, end j

        #### Compute offset = i * 100 + j ####
        addi $t4, $zero, 0        # offset = 0
        addi $t8, $zero, 0        # counter = 0

end_inner:
        addi $t0, $t0, 1          # i++
        j outer_loop

end_outer:
        # sum1 is in $t2 (could store or return if needed)
        # Program end (or return sum1 in $v0 if we had syscall conventions)
        j end_outer              # Infinite loop to end program
