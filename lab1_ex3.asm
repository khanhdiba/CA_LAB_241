.data
Ina: .asciiz "\nInsert a: "
Inb: .asciiz "\nInsert b: "
Inc: .asciiz "\nInsert c: "
Ind: .asciiz "\nInsert d: "

F: .asciiz "\nF = "
remain: .asciiz ", remainder "
.text
main:
	## assume: a: t0, b: t1, c:t2, d:t3
	
	#Input a
	li $v0, 4
	la $a0, Ina
	syscall
	
	li $v0, 5
	syscall
	addi $t0, $v0, 0

	#Input b
	li $v0, 4
	la $a0, Inb
	syscall
	
	li $v0, 5
	syscall
	addi $t1, $v0, 0
	
	#Input c
	li $v0, 4
	la $a0, Inc
	syscall
	
	li $v0, 5
	syscall
	addi $t2, $v0, 0
	
	#Input d
	li $v0, 4
	la $a0, Ind
	syscall
	
	li $v0, 5
	syscall
	addi $t3, $v0, 0
	
	## (a + 10): t4, (b - d): t5, (c - 2a): t6, (a + b + c): t7
	
	# (a + 10)
	addi $t4, $t0, 10
	
	# (b - d)
	sub $t5, $t1, $t3
	
	# (c - 2a)
	sub $t6, $t2, $t0
	sub $t6, $t6, $t0
	
	# (a + b + c)
	add $t7, $t0, $t1
	add $t7, $t7, $t2
	
	## tu so : t8, mau so : t7
	#tuso
	mult $t4, $t5
	mflo $t8
	
	mult $t8, $t6
	mflo $t8
	
	div $t8, $t7
	
	## F: $t9, remainder $s0
	mflo $t9
	mfhi $s0
	
	#print
	li $v0, 4
	la $a0, F
	syscall
	
	add $a0, $zero, $t9
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, remain
	syscall
	
	add $a0, $zero, $s0
	li $v0, 1
	syscall

	li $v0, 10
	syscall
