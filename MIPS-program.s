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

    li $t1, 0           # First Fibonacci number (F0)
    li $t2, 1           # Second Fibonacci number (F1)
    li $t3, 0           # Counter for number of terms printed

    # Print F0 (0)
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 11
    li $a0, ' '
    syscall

    sequence_loop:
        # Print next Fibonacci number
        li $v0, 1
        move $a0, $t2
        syscall

        # Print space after number
        li $v0, 11
        li $a0, ' '
        syscall

        # Increment counter
        addi $t3, $t3, 1

        add $t4, $t1, $t2  # Next number = previous two numbers added

        move $t1, $t2      # Previous number becomes current number
        move $t2, $t4      # Current number becomes next number
        blt $t3, $t0, sequence_loop
        
    j exit

    error_handler: