.data
input_prompt: .asciiz "\nPlease enter a positive integer less than 16: "
output_prompt: .asciiz "\nIt's binary form is: "

output: .word 16
.text
main:
	li $v0, 4
	la $a0, input_prompt
	syscall
	
	li $v0, 5
	syscall
	
	slti $t0, $v0, 0 # v0 < 0 -> t0 = 1
	beq $t0, 1, main
	
	slti $t0, $v0, 16 # v0 < 16, t0 = 1
	beq $t0, 0, main
	
	add $t1, $v0, $zero
	add $t4, $zero, 2
	addi $t2, $zero, 0
	
	la $t5, output
	
loop:
	div $t1, $t4
	mfhi $t3
	mflo $t1
	
	
	sw $t3, 0($t5)
	addi $t2, $t2, 1
	beq $t2, 4, print
	
	addi $t5, $t5, 4
	
	j loop
	
print:
	li $v0, 4
	la $a0, output_prompt
	syscall
	

	la $t5, output

	lw $t3, 12($t5)
	add $a0, $0, $t3
	li $v0, 1
	syscall

	lw $t3, 8($t5)
	add $a0, $0, $t3
	li $v0, 1
	syscall
	
	lw $t3, 4($t5)
	add $a0, $0, $t3
	li $v0, 1
	syscall
	
	lw $t3, 0($t5)
	add $a0, $0, $t3
	li $v0, 1
	syscall
exit: 

	
	li $v0, 10
	syscall
	
	 
