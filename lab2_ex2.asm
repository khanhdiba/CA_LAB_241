.data
array: .word 20
input1: .asciiz "Please input number 1: "
input2: .asciiz "Please input number 2: "
input3: .asciiz "Please input number 3: "
input4: .asciiz "Please input number 4: "
input5: .asciiz "Please input number 5: "
space: .asciiz "  "
.text
main:
	#number 1
	la $s1, array
	li $v0, 4
	la $a0, input1
	syscall
	
	li $v0, 5
	syscall
	add $a0, $0, $v0	
	sw $a0, 0($s1)

	#number 2
	li $v0, 4
	la $a0, input2
	syscall
	
	li $v0, 5
	syscall
	add $a0, $0, $v0	
	sw $a0, 4($s1)
	
	#number 3
	li $v0, 4
	la $a0, input3
	syscall
	
	li $v0, 5
	syscall
	add $a0, $0, $v0	
	sw $a0, 8($s1)
	#number 4
	li $v0, 4
	la $a0, input4
	syscall
	
	li $v0, 5
	syscall
	add $a0, $0, $v0	
	sw $a0, 12($s1)
	#number 5
	li $v0, 4
	la $a0, input5
	syscall
	
	li $v0, 5
	syscall
	add $a0, $0, $v0	
	sw $a0, 16($s1)
	
	addi $t1, $0, 5
	addi $t3, $0, 4
	la $s1, array
loop:
	beq $t1, 0, next
	
	lw $t2, ($s1)
	div $t2, $t3
	mfhi $t5
	
	beq $t5, 0, du0
	beq $t5, 1, du1
	beq $t5, 2, du2
	beq $t5, 3, du3
	
cont:	sw $t6, 0($s1)
	
	addi $s1, $s1, 4
	addi $t1, $t1, -1
	j loop

next:	addi $t1, $0, 5
	la $s1, array
print:
	beq $t1, 0, end
	
	lw $t2, ($s1)
	addi $a0, $t2, 0
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $s1, $s1, 4
	addi $t1, $t1, -1
	j print

end:
	li $v0, 10
	syscall
	
du1:
	addi $t6, $t2, -1
	j cont
du2:
	addi $t6, $t2, -2
	j cont
du3: 
	addi $t6, $t2, 1
	j cont
du0:
	addi $t6, $t2, 0
	j cont