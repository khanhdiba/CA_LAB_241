.data
input_file: .asciiz "C:/Users/ACER/Desktop/raw_input.txt"
read_content: .space 1024
output_file: .asciiz "C:/Users/ACER/Desktop/formatted_result.txt"
name: .space 1024
id: .space 1024
addr: .space 1024
age: .space 1024
reli: .space 1024

spi: .asciiz "---Student personal information---\n"
N: .asciiz "Name: "

I: .asciiz "ID: "

A: .asciiz "Address: "

Ag: .asciiz "Age: "

R: .asciiz "Religion: "

newline: .asciiz "\n"
.text
main:
	#open file
	li $v0, 13
	la $a0, input_file
	li $a1, 0
	syscall
	move $s1, $v0
	
	#write in the file
	li $v0, 14
	move $a0, $s1
	la $a1, read_content
	la $a2, 1024
	syscall
	
	#close file
	li $v0, 16
	move $a0, $s1
	syscall
	
	la $s0, read_content
	lb $t0, ($s0)
	la $s1, name
name_loop:
	beq $t0, 44, fin_name_loop
	sb $t0, ($s1)
	
	addi $s0, $s0, 1
	addi $s1, $s1, 1
	lb $t0, ($s0)
	
	j name_loop
	
fin_name_loop:	
	addi $s0, $s0, 1
	lb $t0, ($s0)
	la $s1, id
id_loop:
	beq $t0, 44, fin_id_loop
	sb $t0, ($s1)
	
	addi $s0, $s0, 1
	addi $s1, $s1, 1
	lb $t0, ($s0)
	
	j id_loop
	
fin_id_loop:
	addi $s0, $s0, 1
	lb $t0, ($s0)
	la $s1, addr
addr_loop:
	beq $t0, 44, fin_addr_loop
	sb $t0, ($s1)
	
	addi $s0, $s0, 1
	addi $s1, $s1, 1
	lb $t0, ($s0)
	
	j addr_loop
	
fin_addr_loop:
	addi $s0, $s0, 1
	lb $t0, ($s0)
	la $s1, age
age_loop:
	beq $t0, 44, fin_age_loop
	sb $t0, ($s1)
	
	addi $s0, $s0, 1
	addi $s1, $s1, 1
	lb $t0, ($s0)
	
	j age_loop
	
fin_age_loop:
	addi $s0, $s0, 1
	lb $t0, ($s0)
	la $s1, reli
	
reli_loop:
	beq $t0, 0, fin_reli_loop
	sb $t0, ($s1)
	
	addi $s0, $s0, 1
	addi $s1, $s1, 1
	lb $t0, ($s0)
	
	j reli_loop
	
fin_reli_loop:
	#open file
	li $v0, 13
	la $a0, output_file
	li $a1, 1
	syscall
	move $s1, $v0
	
	#write in the file
	li $v0, 15
	move $a0, $s1
	la $a1, spi
	la $a2, 35
	syscall

	li $v0, 15
	move $a0, $s1
	la $a1, N
	la $a2, 6
	syscall
	
	li $v0, 15
	move $a0, $s1
	la $a1, name
	la $a2, 10
	syscall
	
	li $v0, 15
	move $a0, $s1
	la $a1, newline
	la $a2, 1
	syscall
	
	li $v0, 15
	move $a0, $s1
	la $a1, I
	la $a2, 4
	syscall
	
	li $v0, 15
	move $a0, $s1
	la $a1, id
	la $a2, 7
	syscall
	
	li $v0, 15
	move $a0, $s1
	la $a1, newline
	la $a2, 1
	syscall

	li $v0, 15
	move $a0, $s1
	la $a1, A
	la $a2, 9
	syscall
	
	li $v0, 15
	move $a0, $s1
	la $a1, addr
	la $a2, 46
	syscall
	
	li $v0, 15
	move $a0, $s1
	la $a1, newline
	la $a2, 1
	syscall
	
	li $v0, 15
	move $a0, $s1
	la $a1, Ag
	la $a2, 5
	syscall
	
	li $v0, 15
	move $a0, $s1
	la $a1, age
	la $a2, 2
	syscall
	
	li $v0, 15
	move $a0, $s1
	la $a1, newline
	la $a2, 1
	syscall
	
	li $v0, 15
	move $a0, $s1
	la $a1, R
	la $a2, 10
	syscall
	
	li $v0, 15
	move $a0, $s1
	la $a1, reli
	la $a2, 10
	syscall

	li $v0, 4
	la $a0, spi
	syscall
	
	li $v0, 4
	la $a0, N
	syscall
	
	li $v0, 4
	la $a0, name
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, I
	syscall
	
	li $v0, 4
	la $a0, id
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, A
	syscall
	
	li $v0, 4
	la $a0, addr
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, Ag
	syscall
	
	li $v0, 4
	la $a0, age
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, R
	syscall
	
	li $v0, 4
	la $a0, reli
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	#close file
	li $v0, 16
	move $a0, $s1
	syscall

	
End:	li $v0, 10
	syscall
	

	li $v0, 15
	move $a0, $s1
	la $a1, R
	la $a2, 100
	syscall
	
	li $v0, 15
	move $a0, $s1
	la $a1, reli
	la $a2, 100
	syscall
