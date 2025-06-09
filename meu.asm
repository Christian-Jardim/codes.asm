.text
.globl main
main:
        addi    $t1, $zero, 3          # N = 3
        mul     $t2, $t1, $t1          # t2 = N * N = 9

        li        $t0, 0x100            # t0 = base address of matrix
        addi    $t3, $zero, 0          # i = 0
        addi    $t6, $zero, 0          # sum = 0
        addi    $t8, $zero, 4          # word size = 4

loop:
        mul     $t4, $t3, $t8          # offset = i * 4
        add     $t4, $t0, $t4          # effective address = base + offset
        lw       $t5, 0($t4)            # load matrix[i]
        add     $t6, $t6, $t5          # sum += matrix[i]
        addi    $t3, $t3, 1            # i++
        beq     $t3, $t2, end          # if i == N*N, end loop
        j       contunue

end:
        # store result in memory (optiona

        # print result
        li      $v0, 1          # syscall code for print integer
        add    $a0, $zero, $t6        # move sum into $a0
        syscall

        # exit program
        li      $v0, 10         # syscall code for exit
        syscall
