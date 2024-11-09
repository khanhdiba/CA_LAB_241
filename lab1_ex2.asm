.data
str0: .asciiz "\nPlease input element "
str1: .asciiz ": "
idx: .asciiz "\nPlease enter index: "



array: .space 20		#1 int = 4 bytes

output: .asciiz "\nThe output is: "
.text
main:
	la $t0, array
	addi $t1, $zero, 0 	#t1: counter
	
loop:
	beq $t1, 5, ReadIndx
	#Print str0
	li $v0, 4
	la $a0, str0
	syscall
	
	#Print index
	add $a0, $0, $t1 
	li $v0, 1 
	syscall
	
	#Print :
	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0, 5
	syscall
	add $a0, $0, $v0
	sw $a0, 0($t0)
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	
	j loop

ReadIndx:
	li $v0, 4
	la $a0, idx
	syscall
	
	#input index
	li $v0, 5
	syscall
	add $a0, $0, $v0
	
	#check input
	slti $t5, $a0, 0 # a0 < 0 -> t5 = 1
	beq $t5, 1, ReadIndx
	slti $t6, $a0, 5 # a0 <  -> t6 = 1
	beq $t6, 0, ReadIndx
	
	addi $t4, $zero, 4
	
	mul $t3, $t4, $a0
	
	la $t0, array
	add $t0, $t0, $t3
	lw $t1, 0($t0)

	#print prompt
	li $v0, 4
	la $a0, output
	syscall

	#print output result
	add $a0, $0, $t1 
	li $v0, 1 
	syscall
	
	li $v0, 10 
	syscall
	
	
	
	

	