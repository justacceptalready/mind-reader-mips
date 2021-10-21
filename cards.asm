#printing cards randomly (while loops)
.data
.align 2
prompt1: .asciiz "\nThink of a number between 1 and 63, answer 6 simple questions, and the Mind Reader will reveal your number!\n"
.align 2
prompt2: .asciiz "\nPress any key to begin!"
.align 2
dummy: .space 1
.align 2
debug: .asciiz "I'm here!"

.text
play:
li $v0, 4
la $a0, prompt1
syscall

li $v0, 4
la $a0, prompt2
syscall

la $a0, dummy
li $v0, 8
li $a1, 1
syscall
j card1

card1:
li $v0, 4
la $a0, debug
syscall

.globl play

