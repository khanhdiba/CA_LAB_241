.data
array:	.space 1000
string:	.space 100
input:	.asciiz "\nInput your string: "
comma:	.asciiz ", "
semi:	.asciiz "; "
alpha:	.asciiz "abcdefghijklmnopqrstuvwxyz"

.text
main:	
	la $s1, array
	addi $t0, $t0, 26
	
for:	
	sw $zero, ($s1)
	addi $s1, $s1, 4
	addi $t0, $t0, -1
	bne $t0, $zero, for
	la $s1, array
	
	li $v0, 4
	la $a0, input
	syscall
	
	la $a0, string
	addi $a1, $0, 100
	li $v0, 8
	syscall
	
	addi $t7, $0, 0
	la $t8, string
	
getlength:
	lb $t9, 0($t8)
	beqz $t9, a
	addi $t7, $t7, 1
	addi $t8, $t8, 1
	j getlength

a:
	addi $t7, $t7, -1
	la $s2, string
	add $t3, $zero, $t7
	
loop:	
	la $s1, array
	lb $t4, 0($s2)
	addi $t4, $t4, -97
	beq $t4, $zero, keepdo
	
di:	
	addi $s1, $s1, 4
	addi $t4, $t4, -1
	bne $t4, 0, di
	
keepdo:	
	lw $t5, ($s1)
	addi $t5, $t5, 1
	sw $t5, ($s1)
	addi $s2, $s2, 1
	addi $t3, $t3, -1
	bne $t3, $zero, loop

	
	addi $t3, $zero, 0
	addi $t0, $zero, 0 
alloop:
	la $s1, array
	la $s2, alpha
	addi $t4, $zero, 26
	
For:	
	lw $t1, ($s1)
	beq $t1, $t0, plus
	
keepdo1:
	beq $t1, 0, skip
	beq $t1, $t0, xuli
	
skip:	
	addi $s2, $s2, 1
	addi $s1, $s1, 4
	addi $t4, $t4, -1
	bne $t4, 0, For
	addi $t0, $t0, 1
	bne $t3, 26, alloop
	
	li $v0, 10
	syscall
	
plus:	
	addi $t3, $t3, 1
	j keepdo1
	
xuli:	
	lb $t2, ($s2)
	li $v0, 11
	la $a0, ($t2)
	syscall
	
	li $v0, 4
	la $a0, comma
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	beq $t3, 26, stop
	
	li $v0,4
	la $a0, semi
	syscall
	
stop:	
	j skip