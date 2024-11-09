.data
ina: .asciiz "\nPlease insert a: "
inb: .asciiz "\nPlease insert b: "
inc: .asciiz "\nPlease insert c: "

a: .float 0
bb: .float 0
c: .float 0
delta: .float 0
number4: .float 4.0
number0: .float 0.0
number2: .float 2.0

x1: .asciiz "\nx1 = "
x2: .asciiz "\nx2 = "
x: .asciiz "\nThere is one solution, x = "
no: .asciiz "\nThere is no real solution"
many: .asciiz "\nThere are many real solutions"
.text
main:
	li $v0, 4
	la $a0, ina
	syscall
	
	li $v0, 6
	syscall
	swc1 $f0, a
	
	li $v0, 4
	la $a0, inb
	syscall
	
	li $v0, 6
	syscall
	swc1 $f0, bb
	
	li $v0, 4
	la $a0, inc
	syscall
	
	li $v0, 6
	syscall
	swc1 $f0, c
#######################
	lwc1 $f0, a
	lwc1 $f1, bb
	lwc1 $f2, c
	lwc1 $f3, number0
	c.eq.s $f0, $f3
	bc1t a0
	
	j ex
a0:
	c.eq.s $f1, $f3
	bc1t b0
	
	neg.s $f2, $f2
	div.s $f2, $f2, $f1
	
	li $v0, 4
	la $a0, x
	syscall
	
	li $v0, 2
	mov.s $f12, $f2
	syscall
	
	j End
b0:
	c.eq.s $f2, $f3
	bc1t c0
	
	li $v0, 4
	la $a0, no
	syscall
	
	j End
c0:
	li $v0, 4
	la $a0, many
	syscall
	
	j End
#######################
ex:	
	lwc1 $f0, bb
	lwc1 $f1, a
	lwc1 $f2, c
	lwc1 $f3, number4
	#tinh delta
	mul.s $f0, $f0, $f0	#b^2
	mul.s $f1, $f1, $f2	#ac
	mul.s $f1, $f1, $f3	#4ac
	sub.s $f2, $f0, $f1	#delta
	swc1 $f2, delta
	
	lwc1, $f0, number0
	c.lt.s $f2, $f0
	bc1t no_solu
	
	c.eq.s $f0, $f2
	bc1t one_solu
	
two_solu:
	lwc1 $f0, delta
	lwc1 $f1, bb
	lwc1 $f2, a
	lwc1 $f3, number2
	
	neg.s $f1, $f1	#-b
	mul.s $f2, $f2, $f3 #2a
	sqrt.s $f0, $f0 #sqrt(delta)
	
	sub.s $f4, $f1, $f0
	div.s $f4, $f4, $f2
	
	add.s $f5, $f1, $f0
	div.s $f5, $f5, $f2
	
	li $v0, 4
	la $a0, x1
	syscall
	
	li $v0, 2
	mov.s $f12, $f4
	syscall
	
	li $v0, 4
	la $a0, x2
	syscall
	
	li $v0, 2
	mov.s $f12, $f5
	syscall
	
	j End
one_solu:
	lwc1 $f1, bb
	lwc1 $f2, a
	lwc1 $f3, number2
	
	neg.s $f1, $f1	#-b
	mul.s $f2, $f2, $f3 #2a

	div.s $f1, $f1, $f2
	
	li $v0, 4
	la $a0, x
	syscall
	
	li $v0, 2
	mov.s $f12, $f1
	syscall
	
	j End
no_solu:
	li $v0, 4
	la $a0, no
	syscall

	j End
	
End:
	li $v0, 10
	syscall
	
	