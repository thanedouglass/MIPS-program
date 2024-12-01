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

        li $v0, 5
        syscall

        move $t0, $v0       # Store input in $t0
        blt $t0, 25, error_handler   # Branch if input < 25
        blez $t0, error_handler      # Branch if input <= 0