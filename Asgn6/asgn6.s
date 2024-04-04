   .data               # start of data section
    # put any global or static variables here
    A:.quad 0    # Variable A (64-bit, signed, initialized to 0)
    B:.quad 0    # Variable B (64-bit, signed, initialized to 0)

   .section.rodata    # start of read-only data section
    # constants here, such as strings
    # modifying these during runtime causes a segmentation fault, so be cautious!
    resultString:.string "Result for A*5: %d\n"
    resultString2:.string "Result for (A + B) - (A / B): %d\n"
    resultString3:.string "Result for (A - B) + (A * B): %d\n"
    inputFormat:.string "%d"
    instructionStringA:.string "Enter an integer value for A: "
    instructionStringB:.string "Enter an integer value for B: "

   .text               # start of text /code
    # everything inside.text is read-only, which includes your code!
   .global main        # required, tells gcc where to begin execution

    # === functions here ===

    multiplyABy5:
        # Output: Result in %rax

        # Load A from memory and sign-extend it
        movslq A, %edi

        # Multiply the value in %edi,which is A, by 5
        imulq $5, %edi

        # Store the result in %rax
        movq %edi, %rax

        ret


    subtractInts:
        # Return value in %eax

        # Load A from memory into %edi
        movslq A, %edi

        # Load B from memory into %esi
        movslq B, %esi


        # Callee Saving
        pushq %rbp
        movq %rsp, %rbp
        pushq %rdi
        pushq %rsi

        # Divide A by B
        movq %rdi, %rax  # Move A to %rax
        cqto
        idivq %rsi  # Divide %rdx:%rax by %rsi; quotient in %rax, remainder in %rdx

        # Add (A + B) - (A / B)
        addq %rdi, %rsi  
        subq %rax, %rsi

        # Move the result to %eax
        movl %esi, %eax

        # Callee Saving
        popq %rsi
        popq %rdi
        leave
        ret

    addInts:
        # Return value in %eax

        # Load A from memory into %edi
        movslq A, %edi

        # Load B from memory into %esi
        movslq B, %esi

        # Callee Saving
        pushq %rbp
        movq %rsp, %rbp
        pushq %rdi
        pushq %rsi

        # Save the original A and B values
        movq %rdi, %rcx  # Save A
        movq %rsi, %rdx  # Save B

        # Multiply A by B
        imulq %rdx, %rcx

        # Subtract (A - B) + (A * B)
        subq %rdx, %rdi  # Subtract B from the original A
        addq %rcx, %rdi  # Add the result of the multiplication

        movl %edi, %eax  # Return the result

        # Callee Saving
        popq %rsi
        popq %rdi
        leave
        ret

    main:                   # start of main() function
        # Preamble
        pushq %rbp
        movq %rsp, %rbp

        # === main() code here ===

        # Print instruction for A
        movq $instructionStringA, %edi
        callq printf

        # Prompt the user to enter a value for A
        movq $inputFormat, %edi
        movq $A, %esi  # Load the address of A into %esi
        xorq %rax, %rax # Clear rax
        callq scanf

        # Print instruction for B
        movq $instructionStringB, %edi
        callq printf

        # Prompt the user to enter a value for B
        movq $inputFormat, %edi
        movq $B, %esi  # Load the address of B into %esi
        xorq %rax, %rax # Clear rax
        callq scanf

        # Call multiplyABy5