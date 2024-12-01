.data
    prompt: .asciiz "Please enter a positive integer >= 25: "
    error:  .asciiz "Illegal Number!\n"
    space:  .asciiz " "

.text
    .globl main
main:
    input_loop:
        li $v0, 4
        la $a0, prompt
        syscall