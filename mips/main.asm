.data
nl: .asciiz "\n"
prompt: .asciiz "Enter a number: "
result1: .asciiz "Factorial of "
result2: .asciiz " is "

.text
main:
	li $v0, 4
	la $a0, prompt
	syscall
	li $v0, 5
	syscall
	move $s0, $v0
	move $s1, $v0
	move $a0, $s0
	jal fatorial	
	move $s2, $v0	
	la $a0, result1
	li $v0, 4
	syscall	 	
	move $a0, $s1
	li $v0, 1
	syscall	
	la $a0, result2
	li $v0, 4
	syscall	
	move $a0, $s2
	li $v0, 1
	syscall		
	la $a0, nl
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall

fatorial:
    addi    $sp, $sp, -8
    sw      $s0, 4($sp)
    sw      $ra, 0($sp)
    bne     $a0, $zero, else
    addi    $v0, $zero, 1 
    j fact_return

else:
    move    $s0, $a0
    addi    $a0, $a0, -1
    jal     fatorial
    multu   $s0, $v0
    mflo    $v0
    
fact_return:
    lw      $s0, 4($sp)
    lw      $ra, 0($sp)
    addi    $sp, $sp, 8
    jr      $ra
