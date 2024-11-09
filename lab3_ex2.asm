####	fx = 1/(d^4 + e^3) . (a/7 * x^7 + b/5 * x^6 + c/2 * x^2)
.data

inu: .asciiz "\nPlease insert u: "
inv: .asciiz "\nPlease insert v: "
ina: .asciiz "\nPlease insert a: "
inb: .asciiz "\nPlease insert b: "
inc: .asciiz "\nPlease insert c: "
ind: .asciiz "\nPlease insert d: "
ine: .asciiz "\nPlease insert e: "

u: .float 0
v: .float 0
a: .float 0
bb: .float 0
c: .float 0
d: .float 0
e: .float 0
number0: .float 0
mau: .float 0
cannot: .asciiz "Cannot calculate the equation."

one7: .float 0.14285714285
one6: .float 0.16666666666
one2: .float 0.5
.text
main:
	li $v0, 4
	la $a0, inu
	syscall
	
	li $v0, 6
	syscall
	swc1 $f0, u
	
	li $v0, 4
	la $a0, inv
	syscall
	
	li $v0, 6
	syscall
	swc1 $f0, v
	
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
	
	li $v0, 4
	la $a0, ind
	syscall
	
	li $v0, 6
	syscall
	swc1 $f0, d
	
	li $v0, 4
	la $a0, ine
	syscall
	
	li $v0, 6
	syscall
	swc1 $f0, e
	
mau_so:
	lwc1 $f0, d
	lwc1 $f1, e
	
	mul.s $f0, $f0, $f0
	mul.s $f0, $f0, $f0
	
	mul.s $f2, $f1, $f1
	mul.s $f2, $f2, $f1
	
	add.s $f0, $f0, $f2
	swc1 $f0, mau
	
	lwc1 $f1, number0
	c.eq.s $f0, $f1
	bc1t cannot_calcu
	
	#a/7 * (u^7 - v^7)
	lwc1 $f0, u
	lwc1 $f2, v
	
	#u7
	mul.s $f1, $f0, $f0
	mul.s $f1, $f1, $f1
	mul.s $f1, $f1, $f1
	div.s $f1, $f1, $f0
	#v7
	mul.s $f3, $f2, $f2
	mul.s $f3, $f3, $f3
	mul.s $f3, $f3, $f3
	div.s $f3, $f3, $f2
	
	sub.s $f4, $f1, $f3
	
	lwc1 $f5, a
	lwc1 $f6, one7
	
	mul.s $f5, $f5, $f6
	mul.s $f5, $f5, $f4
	
	mov.s $f31, $f5
	
	#b/5 * x^6
	lwc1 $f0, u
	lwc1 $f2, v
	
	#u6
	mul.s $f1, $f0, $f0
	mul.s $f1, $f1, $f1
	mul.s $f1, $f1, $f1
	div.s $f1, $f1, $f0
	div.s $f1, $f1, $f0
	#v6
	mul.s $f3, $f2, $f2
	mul.s $f3, $f3, $f3
	mul.s $f3, $f3, $f3
	div.s $f3, $f3, $f2
	div.s $f3, $f3, $f2
	
	sub.s $f4, $f1, $f3
	
	lwc1 $f5, bb
	lwc1 $f6, one6
	
	mul.s $f5, $f5, $f6
	mul.s $f5, $f5, $f4
	
	mov.s $f30, $f5
	
	# c/2 * x^2
	lwc1 $f0, u
	lwc1 $f2, v
	
	#u2
	mul.s $f1, $f0, $f0
	#v2
	mul.s $f3, $f2, $f2
	
	sub.s $f4, $f1, $f3
	
	lwc1 $f5, c
	lwc1 $f6, one2
	
	mul.s $f5, $f5, $f6
	mul.s $f5, $f5, $f4
	
	mov.s $f29, $f5
	
	add.s $f0, $f29, $f30
	add.s $f0, $f0, $f31
	lwc1 $f1, mau
	div.s $f0, $f0, $f1
	
	li $v0, 2
	mov.s $f12, $f0
	syscall
	
	j End
	
cannot_calcu:
	li $v0, 4
	la $a0, cannot
	syscall
	
	j End
	
End:
	li $v0, 10
	syscall