	.file	"asgn5.c"                         # File directive indicating the source file
	.text                                    # Start of the text section
	.globl	myAddTwoNumbersFunction           # Declare myAddTwoNumbersFunction as a global symbol
	.type	myAddTwoNumbersFunction, @function  # Define the type of myAddTwoNumbersFunction as a function
myAddTwoNumbersFunction:                   # Start of the myAddTwoNumbersFunction function
.LFB0:                                     # Begin of a function block
	.cfi_startproc                          # Mark the beginning of the procedure
	pushq	%rbp                               # Push the value of the base pointer onto the stack
	.cfi_def_cfa_offset 16                   # Define the CFA (Canonical Frame Address)
	.cfi_offset 6, -16                       # Define the offset for the base pointer
	movq	%rsp, %rbp                         # Move the value of the stack pointer into the base pointer
	.cfi_def_cfa_register 6                  # Define the base pointer as the CFA register
	movl	%edi, -4(%rbp)                     # Move the first argument into a local variable
	movl	%esi, -8(%rbp)                     # Move the second argument into a local variable
	movl	-4(%rbp), %edx                     # Move the first argument into the edx register
	movl	-8(%rbp), %eax                     # Move the second argument into the eax register
	addl	%edx, %eax                         # Add the values in edx and eax and store the result in eax
	# Function epilogue
	popq	%rbp                               # Restore the value of the base pointer from the stack
	.cfi_def_cfa 7, 8                        # Define the new CFA after restoring the base pointer
	ret                                      # Return from the function
	.cfi_endproc                             # Mark the end of the procedure
.LFE0:                                     # End of the function block
	.size	myAddTwoNumbersFunction, .-myAddTwoNumbersFunction  # Specify the size of myAddTwoNumbersFunction
	.section	.rodata                       # Start of the read-only data section
.LC0:                                      # Define a label for a string constant
	.string	"The answer is %d\n"              # Define a string constant
	.text                                    # Return to the text section
	.globl	main                              # Declare main as a global symbol
	.type	main, @function                    # Define the type of main as a function
main:                                      # Start of the main function
.LFB1:                                     # Begin of a function block
	.cfi_startproc                          # Mark the beginning of the procedure
	pushq	%rbp                               # Push the value of the base pointer onto the stack
	.cfi_def_cfa_offset 16                   # Define the CFA (Canonical Frame Address)
	.cfi_offset 6, -16                       # Define the offset for the base pointer
	movq	%rsp, %rbp                         # Move the value of the stack pointer into the base pointer
	.cfi_def_cfa_register 6                  # Define the base pointer as the CFA register
	subq	$16, %rsp                          # Allocate space on the stack for local variables
	movl	$10, -12(%rbp)                     # Move the value 10 into a local variable
	movl	$7, -8(%rbp)                       # Move the value 7 into a local variable
	movl	$0, -4(%rbp)                       # Move the value 0 into a local variable
	movl	-8(%rbp), %edx                     # Move the second argument into the edx register
	movl	-12(%rbp), %eax                    # Move the first argument into the eax register
	movl	%edx, %esi                         # Move the second argument into the esi register
	movl	%eax, %edi                         # Move the first argument into the edi register
	call	myAddTwoNumbersFunction            # Call the myAddTwoNumbersFunction
	movl	%eax, -4(%rbp)                     # Move the result into a local variable
	movl	-4(%rbp), %eax                     # Move the result into the eax register
	movl	%eax, %esi                         # Move the result into the esi register
	leaq	.LC0(%rip), %rdi                   # Load the address of the string constant into the rdi register
	movl	$0, %eax                           # Move the value 0 into the eax register
	call	printf@PLT                        # Call the printf function
	movl	$0, %eax                           # Move the value 0 into the eax register (return 0)
	# Function epilogue
	leave                                    # Restore the value of the base pointer and return
	ret                                      # Return from the function
	.cfi_endproc                             # Mark the end of the procedure
.LFE1:                                     # End of the function block
	.size	main, .-main                       # Specify the size of the main function
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"  # Compiler identification
	.section	.note.GNU-stack,"",@progbits    # Note section for GNU stack
