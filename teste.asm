main:   li      $t8, 1
        sw      $t8, 0($zero)
        sw      $t8, 4($zero)
        sw      $t8, 8($zero)
        sw      $t8, 12($zero)

        addi    $t1, $zero, 2         
        mul     $t2, $t1, $t1          

        li      $t0, 0x0            
        addi    $t3, $zero, 0          
        addi    $t6, $zero, 0         
        addi    $t8, $zero, 4         

loop:   mul     $t4, $t3, $t8          
        add     $t4, $t0, $t4          
        lw      $t5, 0($t4)
        add     $t6, $t6, $t5
        beq     $t3, $t2, end 
        addi    $t3, $t3, 1            
        j       loop

end:    li      $v0, 10         
        syscall
