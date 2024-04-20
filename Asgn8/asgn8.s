# Initialize counter variable to 1
movq $1, %rcx

# Start of while loop
_whileLoop:
    # Check if counter is less than input value
    # If counter is greater than or equal to input value, exit loop
    cmpq %rdi, %rcx
    jg _endWhileLoop

    # Calculate next Fibonacci number
    # Temporarily store next Fibonacci number in %rdx
    movq %rbx, %rdx
    # Calculate next Fibonacci number by adding previous two numbers
    addq %rax, %rbx
    # Update previous Fibonacci number
    movq %rdx, %rax

    # Save registers on the stack to preserve their values
    push %rdx
    push %rbx
    push %rax
    push %rdi
    push %rcx

    # Print the Fibonacci number
    # Set up arguments for printf
    movq $sequenceString, %rdi
    movq %rdx, %rsi
    movq $0, %rax
    call printf

    # Restore registers from the stack
    pop %rcx
    pop %rdi
    pop %rax
    pop %rbx
    pop %rdx

    # Increment counter
    inc %rcx

    # Continue to the next iteration of the loop
    jmp _whileLoop

# End of while loop
_endWhileLoop:
    # Print a newline character
    # Set up arguments for printf
    movq $newLine, %rdi
    movq $0, %rax
    call printf

    # Continue with the rest of the program
```what loop does this use