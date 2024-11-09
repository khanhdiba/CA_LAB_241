.data
str1: .asciiz "\nPlease write your name: "
str2: .asciiz "\nHello, "
strIn: .space 100

.text
main:
	#Output str1
	li $v0, 4
	la $a0, str1
	syscall
	
	#Input Name
	la $a0, strIn
	addi $a1, $0, 10
	li $v0, 8 
	syscall

	#Output Hello,
	li $v0, 4
	la $a0, str2
	syscall

	#Output Name
	li $v0, 4
	la $a0, strIn
	syscall
	
	#Terminate System
	li $v0, 10 
	syscall
