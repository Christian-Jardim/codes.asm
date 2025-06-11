li $t0, 1
li $t1, 2
sw $t0,0($zero)
sw $t0,4($zero)
sw $t0,8($zero)
sw $t2,12($zero)

main:   
li      $t1, 2              
li     $t2, 0          
li      $t0, 0x0                
addi    $t3, $zero, 0           
addi    $t6, $zero, 0           
addi    $t8, $zero, 4           

loop:
beq $t2, $t1, loop_i
mul     $t4, $t1, $t8           
mul     $t4, $t4, $t2           
mul     $t7, $t3, $t8           
add     $t4, $t4, $t7            
add     $t4, $t4, $t0
lw      $t5, 0($t4)             

add     $t6, $t6, $t5           
addi    $t2, $t2, 1            
j       loop                    

loop_i: 
beq $t3, $t1, end
addi $t3, $t3, 1
li $t2, 0
j loop

end:    
li      $v0, 10               
syscall
