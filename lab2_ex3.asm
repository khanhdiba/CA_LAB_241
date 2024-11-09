.data
input: .asciiz "Please insert element "
colon: .asciiz ": "
output: .asciiz "Second largest value is "
outind: .asciiz ", found in index "
comma: .asciiz ", "
array: .word 40
index: .word 40
.text
main:
	la $s1, array
	li $t1, 1
inpu:
	li $v0, 4
	la $a0, input
	syscall
	
	addi $a0, $t1, 0
	li $v0, 1
	syscall

	li $v0, 4
	la $a0, colon
	syscall
	
	li $v0, 5
	syscall
	add $a0, $0, $v0
	sw $a0, ($s1)

	
	addi $t1, $t1, 1
	addi $s1, $s1, 4
	beq $t1, 11, fininpu
	j inpu
fininpu:
	la $s1, array
	lw $t4, ($s1)
	lw $t5, 4($s1)
	slt $t3, $t4, $t5 #t4 < t5 -> t3 = 1
	beq $t3, 1, swap
cont:	addi $s1, $s1, 8
	addi $t1, $0, 8
	#t4 store largest, t5 store second
loop:
	beq $t1, 0, endloop
	
	lw $t2, ($s1)
	#t2 > t4 > t5 -> t4 = t2, t5 = t4
	slt $t3, $t4, $t2
	bne $t3, 0, swaploop1
	#t4 > t2 > t5 -> t5 = t2
	beq $t2, $t4, cont1
	slt $t3, $t5, $t2
	bne $t3, 0, swaploop2
cont1:
	
	addi $s1, $s1, 4
	addi $t1, $t1, -1
	j loop
endloop:
	li $v0, 4
	la $a0, output
	syscall
	
	addi $a0, $t5, 0
	li $v0, 1
	syscall

	li $v0, 4
	la $a0, outind
	syscall
	
	la $s1, array
	addi $t1, $t1, 0
	addi $t9, $t9, 0
countloop:
	beq $t1, 10, tt
	lw $t2, ($s1)
	
	beq $t2, $t5, incre
cnt2:	addi $s1, $s1, 4
	addi $t1, $t1, 1
	j countloop
	
tt:	
	
	la $s1, array
	addi $t7, $t7, 0
	addi $t8, $t8, 0
loopin:
	beq $t7, 10, term
	lw $t2, ($s1)

	beq $t2, $t5, prt
	
cntt:	
	
	addi $s1, $s1, 4
	addi $t7, $t7, 1
	j loopin
	
term:	li $v0, 10
	syscall

swap:
	addi $t6, $t4, 0
	addi $t4, $t5, 0
	addi $t5, $t6, 0
	j cont
swaploop1:
	addi $t5, $t4, 0
	addi $t4, $t2, 0
	j cont1
swaploop2:
	addi $t5, $t2, 0
	j cont1
prt:
	addi $a0, $t7, 0
	li $v0, 1
	syscall
	
	addi $t8, $t8, 1
	bne $t8, $t9, comm

	j cntt
incre:
	addi $t9, $t9, 1
	j cnt2
comm:
	li $v0, 4
	la $a0, comma
	syscall
	
	j cntt