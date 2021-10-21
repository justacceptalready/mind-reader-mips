#user input and game prompts

.data
.align 2
beginGame: .asciiz "\nPlay game y/n: "
.align 2
replay: .asciiz "\nPlay again y/n: "
.align 2
wrong: .asciiz "\nEnter y or n"
.align 2
answer1: .asciiz "y"
.align 2
answer2: .asciiz "Y"
.align 2
answer3: .asciiz "n"
.align 2
answer4: .asciiz "N"
.align 2
input: .space 2

.text
#prompt user to play game
#if input == y or Y play
#else terminate

#prompt user
start:
	li $v0, 4
	la $a0, beginGame
	syscall
#read input
	la $a0, input
	li $v0, 8
	li $a1, 2
	syscall
#if input == y,Y,n,N play game
#else print wrong, loop back to start
compStr:
	lw $t0, input
	lw $t1, answer1
	lw $t2, answer2
	lw $t3, answer3
	lw $t4, answer4
	beq $t0, $t1, play
	beq $t0, $t2, play
	beq $t0, $t3, quit
	beq $t0, $t4, quit
	li $v0, 4
	la $a0, wrong
	syscall
	j start
	
.globl start
.globl compStr
	
	
	

