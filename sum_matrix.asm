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

mult_loop:
        beq  $t8, $t7, mult_done
        add  $t4, $t4, $t0        # offset += i
        addi $t8, $t8, 1
        j mult_loop
mult_done:
        add  $t4, $t4, $t1        # offset += j

        #### Compute address = base + offset * 4 ####
        add  $t5, $t4, $t4        # offset * 2
        add  $t5, $t5, $t5        # offset * 4
        add  $t5, $t3, $t5        # address = base + offset * 4

        lw   $t6, 0($t5)          # Load matrix[i][j]
        add  $t2, $t2, $t6        # sum1 += matrix[i][j]

        addi $t1, $t1, 1          # j++
        j inner_loop

end_inner:
        addi $t0, $t0, 1          # i++
        j outer_loop

end_outer:
        # sum1 is in $t2 (could store or return if needed)
        # Program end (or return sum1 in $v0 if we had syscall conventions)
        j end_outer              # Infinite loop to end program
