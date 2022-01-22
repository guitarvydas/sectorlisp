	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15
	.globl	_Intern                 ## -- Begin function Intern
_Intern:                                ## @Intern
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	_RAM@GOTPCREL(%rip), %rcx
	movl	65536(%rcx), %esi
	testl	%esi, %esi
	je	LBB0_1
## %bb.4:
	movl	(%rcx), %r8d
	xorl	%eax, %eax
LBB0_6:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_16 Depth 2
                                        ##     Child Loop BB0_11 Depth 2
	leal	1(%rax), %edi
	cmpl	%r8d, %esi
	jne	LBB0_10
## %bb.7:                               ##   in Loop: Header=BB0_6 Depth=1
	testl	%r8d, %r8d
	je	LBB0_8
## %bb.15:                              ##   in Loop: Header=BB0_6 Depth=1
	movslq	%edi, %rdx
	leaq	65536(%rcx,%rdx,4), %rdi
	xorl	%esi, %esi
LBB0_16:                                ##   Parent Loop BB0_6 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	(%rdi,%rsi,4), %edx
	cmpl	4(%rcx,%rsi,4), %edx
	jne	LBB0_9
## %bb.12:                              ##   in Loop: Header=BB0_16 Depth=2
	incq	%rsi
	incl	%eax
	testl	%edx, %edx
	jne	LBB0_16
	jmp	LBB0_13
LBB0_9:                                 ##   in Loop: Header=BB0_6 Depth=1
	addl	$2, %eax
	movl	%eax, %edi
	testl	%edx, %edx
	je	LBB0_5
LBB0_10:                                ##   in Loop: Header=BB0_6 Depth=1
	movslq	%edi, %rax
	leaq	65536(%rcx,%rax,4), %rsi
	movl	%edi, %eax
LBB0_11:                                ##   Parent Loop BB0_6 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	incl	%eax
	cmpl	$0, (%rsi)
	leaq	4(%rsi), %rsi
	jne	LBB0_11
LBB0_5:                                 ##   in Loop: Header=BB0_6 Depth=1
	movslq	%eax, %rdx
	movl	65536(%rcx,%rdx,4), %esi
	testl	%esi, %esi
	jne	LBB0_6
	jmp	LBB0_2
LBB0_1:
	xorl	%eax, %eax
LBB0_2:
	movslq	%eax, %rdx
LBB0_3:                                 ## =>This Inner Loop Header: Depth=1
	movl	(%rcx), %esi
	movl	%esi, 65536(%rcx,%rdx,4)
	addq	$4, %rcx
	testl	%esi, %esi
	jne	LBB0_3
	jmp	LBB0_14
LBB0_8:
	xorl	%esi, %esi
LBB0_13:
	subl	%esi, %eax
LBB0_14:
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_GetChar                ## -- Begin function GetChar
_GetChar:                               ## @GetChar
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	_GetChar.l(%rip), %rax
	testq	%rax, %rax
	je	LBB1_2
## %bb.1:
	movq	_GetChar.p(%rip), %rcx
	jmp	LBB1_3
LBB1_2:
	leaq	L_.str(%rip), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	_bestlineWithHistory
	movq	%rax, _GetChar.p(%rip)
	movq	%rax, _GetChar.l(%rip)
	movq	%rax, %rcx
	testq	%rax, %rax
	je	LBB1_7
LBB1_3:
	movzbl	(%rcx), %edx
	testl	%edx, %edx
	je	LBB1_5
## %bb.4:
	incq	%rcx
	movq	%rcx, _GetChar.p(%rip)
	jmp	LBB1_6
LBB1_5:
	movq	%rax, %rdi
	callq	_free
	xorl	%eax, %eax
	movq	%rax, _GetChar.p(%rip)
	movq	%rax, _GetChar.l(%rip)
	movl	$10, %edx
LBB1_6:
	movq	_dx@GOTPCREL(%rip), %rcx
	movl	(%rcx), %eax
	movl	%edx, (%rcx)
	popq	%rbp
	retq
LBB1_7:
	movq	___stdoutp@GOTPCREL(%rip), %rax
	movq	(%rax), %rsi
	movl	$10, %edi
	xorl	%eax, %eax
	callq	_fputwc
	xorl	%edi, %edi
	callq	_exit
	.cfi_endproc
                                        ## -- End function
	.globl	_PrintChar              ## -- Begin function PrintChar
_PrintChar:                             ## @PrintChar
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	___stdoutp@GOTPCREL(%rip), %rax
	movq	(%rax), %rsi
	xorl	%eax, %eax
	popq	%rbp
	jmp	_fputwc                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_GetToken               ## -- Begin function GetToken
_GetToken:                              ## @GetToken
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	xorl	%ebx, %ebx
	movq	_RAM@GOTPCREL(%rip), %r14
	movq	_dx@GOTPCREL(%rip), %r15
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	callq	_GetChar
	cmpl	$33, %eax
	jl	LBB3_1
## %bb.2:                               ##   in Loop: Header=BB3_1 Depth=1
	movl	%eax, (%r14,%rbx,4)
	incq	%rbx
	cmpl	$42, %eax
	jl	LBB3_4
## %bb.3:                               ##   in Loop: Header=BB3_1 Depth=1
	cmpl	$41, (%r15)
	jg	LBB3_1
LBB3_4:
	movl	%ebx, %ecx
	movl	$0, (%r14,%rcx,4)
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_AddList                ## -- Begin function AddList
_AddList:                               ## @AddList
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	%edi, %ebx
	callq	_GetList
	movq	_cx@GOTPCREL(%rip), %rcx
	movslq	(%rcx), %rdx
	movq	_RAM@GOTPCREL(%rip), %rsi
	movl	%eax, 65532(%rsi,%rdx,4)
	leaq	-2(%rdx), %rax
	movl	%eax, (%rcx)
	movl	%ebx, 65528(%rsi,%rdx,4)
                                        ## kill: def $eax killed $eax killed $rax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_GetList                ## -- Begin function GetList
_GetList:                               ## @GetList
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	callq	_GetToken
	cmpl	$41, %eax
	je	LBB5_5
## %bb.1:
	cmpl	$40, %eax
	jne	LBB5_3
## %bb.2:
	callq	_GetList
	jmp	LBB5_4
LBB5_5:
	xorl	%eax, %eax
	jmp	LBB5_6
LBB5_3:
	callq	_Intern
LBB5_4:
	movl	%eax, %ebx
	callq	_GetList
	movq	_cx@GOTPCREL(%rip), %rcx
	movslq	(%rcx), %rdx
	movq	_RAM@GOTPCREL(%rip), %rsi
	movl	%eax, 65532(%rsi,%rdx,4)
	leaq	-2(%rdx), %rax
	movl	%eax, (%rcx)
	movl	%ebx, 65528(%rsi,%rdx,4)
                                        ## kill: def $eax killed $eax killed $rax
LBB5_6:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_GetObject              ## -- Begin function GetObject
_GetObject:                             ## @GetObject
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	cmpl	$40, %edi
	jne	LBB6_2
## %bb.1:
	popq	%rbp
	jmp	_GetList                ## TAILCALL
LBB6_2:
	popq	%rbp
	jmp	_Intern                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_Read                   ## -- Begin function Read
_Read:                                  ## @Read
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	callq	_GetToken
	cmpl	$40, %eax
	jne	LBB7_2
## %bb.1:
	popq	%rbp
	jmp	_GetList                ## TAILCALL
LBB7_2:
	popq	%rbp
	jmp	_Intern                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_PrintAtom              ## -- Begin function PrintAtom
_PrintAtom:                             ## @PrintAtom
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movslq	%edi, %rax
	movq	_RAM@GOTPCREL(%rip), %rcx
	movl	65536(%rcx,%rax,4), %edi
	testl	%edi, %edi
	je	LBB8_3
## %bb.1:
	leaq	65540(%rcx,%rax,4), %rbx
	movq	___stdoutp@GOTPCREL(%rip), %r14
LBB8_2:                                 ## =>This Inner Loop Header: Depth=1
	movq	(%r14), %rsi
	xorl	%eax, %eax
	callq	_fputwc
	movl	(%rbx), %edi
	addq	$4, %rbx
	testl	%edi, %edi
	jne	LBB8_2
LBB8_3:
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_PrintList              ## -- Begin function PrintList
_PrintList:                             ## @PrintList
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edi, %ebx
	movq	___stdoutp@GOTPCREL(%rip), %r14
	movq	(%r14), %rsi
	movl	$40, %edi
	xorl	%eax, %eax
	callq	_fputwc
	movslq	%ebx, %rbx
	movq	_RAM@GOTPCREL(%rip), %r15
	jmp	LBB9_1
LBB9_2:                                 ##   in Loop: Header=BB9_1 Depth=1
	movq	(%r14), %rsi
	testl	%ebx, %ebx
	jns	LBB9_4
## %bb.3:                               ##   in Loop: Header=BB9_1 Depth=1
	movl	$32, %edi
	xorl	%eax, %eax
	callq	_fputwc
	movslq	%ebx, %rbx
LBB9_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	65536(%r15,%rbx,4), %edi
	callq	_PrintObject
	movl	65540(%r15,%rbx,4), %ebx
	testl	%ebx, %ebx
	jne	LBB9_2
	jmp	LBB9_5
LBB9_4:
	movl	$8729, %edi             ## imm = 0x2219
	xorl	%eax, %eax
	callq	_fputwc
	movl	%ebx, %edi
	callq	_PrintObject
LBB9_5:
	movq	(%r14), %rsi
	movl	$41, %edi
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_fputwc                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_PrintObject            ## -- Begin function PrintObject
_PrintObject:                           ## @PrintObject
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	testl	%edi, %edi
	js	LBB10_1
## %bb.2:
	movslq	%edi, %rax
	movq	_RAM@GOTPCREL(%rip), %rcx
	movl	65536(%rcx,%rax,4), %edi
	testl	%edi, %edi
	je	LBB10_5
## %bb.3:
	leaq	65540(%rcx,%rax,4), %rbx
	movq	___stdoutp@GOTPCREL(%rip), %r14
LBB10_4:                                ## =>This Inner Loop Header: Depth=1
	movq	(%r14), %rsi
	xorl	%eax, %eax
	callq	_fputwc
	movl	(%rbx), %edi
	addq	$4, %rbx
	testl	%edi, %edi
	jne	LBB10_4
	jmp	LBB10_5
LBB10_1:
	callq	_PrintList
LBB10_5:
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_Print                  ## -- Begin function Print
_Print:                                 ## @Print
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	callq	_PrintObject
	movq	___stdoutp@GOTPCREL(%rip), %rax
	movq	(%rax), %rsi
	movl	$10, %edi
	xorl	%eax, %eax
	popq	%rbp
	jmp	_fputwc                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_Car                    ## -- Begin function Car
_Car:                                   ## @Car
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movslq	%edi, %rax
	movq	_RAM@GOTPCREL(%rip), %rcx
	movl	65536(%rcx,%rax,4), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_Cdr                    ## -- Begin function Cdr
_Cdr:                                   ## @Cdr
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movslq	%edi, %rax
	movq	_RAM@GOTPCREL(%rip), %rcx
	movl	65540(%rcx,%rax,4), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_Cons                   ## -- Begin function Cons
_Cons:                                  ## @Cons
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	_cx@GOTPCREL(%rip), %r8
	movslq	(%r8), %rdx
	movq	_RAM@GOTPCREL(%rip), %rcx
	movl	%esi, 65532(%rcx,%rdx,4)
	leaq	-2(%rdx), %rax
	movl	%eax, (%r8)
	movl	%edi, 65528(%rcx,%rdx,4)
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_Gc                     ## -- Begin function Gc
_Gc:                                    ## @Gc
	.cfi_startproc
## %bb.0:
	cmpl	%esi, %edi
	jge	LBB15_2
## %bb.1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, %r14d
	movl	%esi, %ebx
	movslq	%edi, %r12
	movq	_RAM@GOTPCREL(%rip), %r13
	movl	65536(%r13,%r12,4), %edi
	callq	_Gc
	movl	%eax, %r15d
	movl	65540(%r13,%r12,4), %edi
	movl	%ebx, %esi
	movl	%r14d, %edx
	callq	_Gc
	movq	_cx@GOTPCREL(%rip), %rcx
	movslq	(%rcx), %rdx
	movl	%eax, 65532(%r13,%rdx,4)
	leaq	-2(%rdx), %rax
	movl	%eax, (%rcx)
	movl	%r15d, 65528(%r13,%rdx,4)
	addl	%r14d, %eax
                                        ## kill: def $eax killed $eax killed $rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB15_2:
	movl	%edi, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_Evlis                  ## -- Begin function Evlis
_Evlis:                                 ## @Evlis
	.cfi_startproc
## %bb.0:
	testl	%edi, %edi
	je	LBB16_2
## %bb.1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%esi, %r15d
	movslq	%edi, %rbx
	movq	_RAM@GOTPCREL(%rip), %r12
	movl	65536(%r12,%rbx,4), %edi
	callq	_Eval
	movl	%eax, %r14d
	movl	65540(%r12,%rbx,4), %edi
	movl	%r15d, %esi
	callq	_Evlis
	movq	_cx@GOTPCREL(%rip), %rcx
	movslq	(%rcx), %rdx
	movl	%eax, 65532(%r12,%rdx,4)
	leaq	-2(%rdx), %rax
	movl	%eax, (%rcx)
	movl	%r14d, 65528(%r12,%rdx,4)
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB16_2:
	xorl	%eax, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_Pairlis                ## -- Begin function Pairlis
_Pairlis:                               ## @Pairlis
	.cfi_startproc
## %bb.0:
	testl	%edi, %edi
	je	LBB17_2
## %bb.1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movslq	%edi, %rax
	movq	_RAM@GOTPCREL(%rip), %rbx
	movl	65536(%rbx,%rax,4), %r8d
	movslq	%esi, %rsi
	movl	65536(%rbx,%rsi,4), %edi
	movq	_cx@GOTPCREL(%rip), %r14
	movslq	(%r14), %rcx
	movl	%edi, 65532(%rbx,%rcx,4)
	leaq	-2(%rcx), %r15
	movl	%r15d, (%r14)
	movl	%r8d, 65528(%rbx,%rcx,4)
	movl	65540(%rbx,%rax,4), %edi
	movl	65540(%rbx,%rsi,4), %esi
	callq	_Pairlis
	movslq	(%r14), %rcx
	movl	%eax, 65532(%rbx,%rcx,4)
	leaq	-2(%rcx), %rax
	movl	%eax, (%r14)
	movl	%r15d, 65528(%rbx,%rcx,4)
                                        ## kill: def $eax killed $eax killed $rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB17_2:
	movl	%edx, %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_Assoc                  ## -- Begin function Assoc
_Assoc:                                 ## @Assoc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	testl	%esi, %esi
	je	LBB18_5
## %bb.1:
	movq	_RAM@GOTPCREL(%rip), %rcx
LBB18_2:                                ## =>This Inner Loop Header: Depth=1
	movslq	%esi, %rdx
	movslq	65536(%rcx,%rdx,4), %rsi
	cmpl	%edi, 65536(%rcx,%rsi,4)
	je	LBB18_3
## %bb.4:                               ##   in Loop: Header=BB18_2 Depth=1
	movl	65540(%rcx,%rdx,4), %esi
	testl	%esi, %esi
	jne	LBB18_2
	jmp	LBB18_5
LBB18_3:
	movl	65540(%rcx,%rsi,4), %eax
LBB18_5:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_Evcon                  ## -- Begin function Evcon
_Evcon:                                 ## @Evcon
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%esi, %r14d
	movl	%edi, %r12d
	movslq	%edi, %rbx
	movq	_RAM@GOTPCREL(%rip), %r15
	movslq	65536(%r15,%rbx,4), %rax
	movl	65536(%r15,%rax,4), %edi
	jmp	LBB19_1
LBB19_2:                                ##   in Loop: Header=BB19_1 Depth=1
	movslq	%r12d, %rax
	movl	65540(%r15,%rax,4), %r12d
	movslq	%r12d, %rbx
	movslq	65536(%r15,%rbx,4), %rax
	movl	65536(%r15,%rax,4), %edi
	movl	%r14d, %esi
LBB19_1:                                ## =>This Inner Loop Header: Depth=1
	callq	_Eval
	testl	%eax, %eax
	je	LBB19_2
## %bb.3:
	leaq	65536(%r15,%rbx,4), %rax
	movslq	(%rax), %rax
	movslq	65540(%r15,%rax,4), %rax
	movl	65536(%r15,%rax,4), %edi
	movl	%r14d, %esi
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_Eval                   ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_Apply                  ## -- Begin function Apply
_Apply:                                 ## @Apply
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, %ebx
	movl	%esi, %r14d
	movl	%edi, %eax
	testl	%edi, %edi
	js	LBB20_3
LBB20_1:                                ## =>This Inner Loop Header: Depth=1
	cmpl	$36, %eax
	jl	LBB20_4
## %bb.2:                               ##   in Loop: Header=BB20_1 Depth=1
	movl	%eax, %edi
	movl	%ebx, %esi
	callq	_Eval
	testl	%eax, %eax
	jns	LBB20_1
LBB20_3:
	cltq
	movq	_RAM@GOTPCREL(%rip), %rcx
	movslq	65540(%rcx,%rax,4), %rax
	movslq	65540(%rcx,%rax,4), %rdx
	movl	65536(%rcx,%rdx,4), %r15d
	movl	65536(%rcx,%rax,4), %edi
	movl	%r14d, %esi
	movl	%ebx, %edx
	callq	_Pairlis
	movl	%r15d, %edi
	movl	%eax, %esi
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_Eval                   ## TAILCALL
LBB20_4:
	cmpl	$25, %eax
	jle	LBB20_5
## %bb.8:
	cmpl	$26, %eax
	je	LBB20_14
## %bb.9:
	cmpl	$30, %eax
	je	LBB20_12
## %bb.10:
                                        ## implicit-def: $ecx
	cmpl	$35, %eax
	jne	LBB20_15
## %bb.11:
	movslq	%r14d, %rax
	movq	_RAM@GOTPCREL(%rip), %rdx
	movl	65536(%rdx,%rax,4), %esi
	movslq	65540(%rdx,%rax,4), %rax
	xorl	%ecx, %ecx
	cmpl	65536(%rdx,%rax,4), %esi
	sete	%cl
	shll	$2, %ecx
	jmp	LBB20_15
LBB20_5:
	cmpl	$17, %eax
	je	LBB20_13
## %bb.6:
                                        ## implicit-def: $ecx
	cmpl	$22, %eax
	jne	LBB20_15
## %bb.7:
	movslq	%r14d, %rax
	movq	_RAM@GOTPCREL(%rip), %rcx
	movslq	65536(%rcx,%rax,4), %rax
	movl	65536(%rcx,%rax,4), %ecx
	jmp	LBB20_15
LBB20_14:
	movslq	%r14d, %rax
	movq	_RAM@GOTPCREL(%rip), %rcx
	movslq	65536(%rcx,%rax,4), %rax
	movl	65540(%rcx,%rax,4), %ecx
	jmp	LBB20_15
LBB20_12:
	movslq	%r14d, %rax
	movq	_RAM@GOTPCREL(%rip), %rdx
	movl	65536(%rdx,%rax,4), %esi
	movslq	65540(%rdx,%rax,4), %rax
	movl	65536(%rdx,%rax,4), %eax
	movq	_cx@GOTPCREL(%rip), %rdi
	movslq	(%rdi), %rbx
	movl	%eax, 65532(%rdx,%rbx,4)
	leaq	-2(%rbx), %rcx
	movl	%ecx, (%rdi)
	movl	%esi, 65528(%rdx,%rbx,4)
	jmp	LBB20_15
LBB20_13:
	movslq	%r14d, %rax
	movq	_RAM@GOTPCREL(%rip), %rcx
	movl	65536(%rcx,%rax,4), %ecx
	shrl	$29, %ecx
	notl	%ecx
	andl	$4, %ecx
LBB20_15:
	movl	%ecx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_Eval                   ## -- Begin function Eval
_Eval:                                  ## @Eval
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%esi, %ebx
	testl	%edi, %edi
	js	LBB21_6
## %bb.1:
	xorl	%eax, %eax
	testl	%ebx, %ebx
	je	LBB21_15
## %bb.2:
	movq	_RAM@GOTPCREL(%rip), %rcx
LBB21_3:                                ## =>This Inner Loop Header: Depth=1
	movslq	%ebx, %rdx
	movslq	65536(%rcx,%rdx,4), %rsi
	cmpl	%edi, 65536(%rcx,%rsi,4)
	je	LBB21_4
## %bb.5:                               ##   in Loop: Header=BB21_3 Depth=1
	movl	65540(%rcx,%rdx,4), %ebx
	testl	%ebx, %ebx
	jne	LBB21_3
	jmp	LBB21_15
LBB21_6:
	movslq	%edi, %rax
	movq	_RAM@GOTPCREL(%rip), %r12
	movl	65536(%r12,%rax,4), %r15d
	cmpl	$6, %r15d
	jne	LBB21_8
## %bb.7:
	movslq	65540(%r12,%rax,4), %rax
	movl	65536(%r12,%rax,4), %eax
	jmp	LBB21_15
LBB21_4:
	movl	65540(%rcx,%rsi,4), %eax
	jmp	LBB21_15
LBB21_8:
	movq	_cx@GOTPCREL(%rip), %r13
	movl	(%r13), %r14d
	movl	65540(%r12,%rax,4), %edi
	cmpl	$12, %r15d
	jne	LBB21_10
## %bb.9:
	movl	%ebx, %esi
	callq	_Evcon
	jmp	LBB21_11
LBB21_10:
	movl	%ebx, %esi
	callq	_Evlis
	movl	%r15d, %edi
	movl	%eax, %esi
	movl	%ebx, %edx
	callq	_Apply
LBB21_11:
	movslq	(%r13), %rbx
	movl	%r14d, %edx
	subl	%ebx, %edx
	movl	%eax, %edi
	movl	%r14d, %esi
	callq	_Gc
	movslq	(%r13), %rcx
	cmpl	%ebx, %ecx
	jge	LBB21_14
## %bb.12:
	movslq	%r14d, %rdx
	leaq	65532(%r12,%rdx,4), %rdx
LBB21_13:                               ## =>This Inner Loop Header: Depth=1
	movl	65532(%r12,%rbx,4), %esi
	decq	%rbx
	movl	%esi, (%rdx)
	decl	%r14d
	addq	$-4, %rdx
	cmpq	%rcx, %rbx
	jg	LBB21_13
LBB21_14:
	movl	%r14d, (%r13)
LBB21_15:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	leaq	L_.str.2(%rip), %rsi
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	callq	_setlocale
	movq	_bestlineUppercase@GOTPCREL(%rip), %rdi
	callq	_bestlineSetXlatCallback
	leaq	l_.str.3(%rip), %rax
	movq	_RAM@GOTPCREL(%rip), %rcx
LBB22_1:                                ## =>This Inner Loop Header: Depth=1
	movsbl	(%rbx,%rax), %edx
	movl	%edx, 65536(%rcx,%rbx,4)
	incq	%rbx
	cmpq	$38, %rbx
	jne	LBB22_1
## %bb.2:
	movq	_cx@GOTPCREL(%rip), %r14
	movq	___stdoutp@GOTPCREL(%rip), %rbx
LBB22_3:                                ## =>This Inner Loop Header: Depth=1
	movl	$0, (%r14)
	callq	_Read
	movl	%eax, %edi
	xorl	%esi, %esi
	callq	_Eval
	movl	%eax, %edi
	callq	_PrintObject
	movq	(%rbx), %rsi
	movl	$10, %edi
	xorl	%eax, %eax
	callq	_fputwc
	jmp	LBB22_3
	.cfi_endproc
                                        ## -- End function
	.comm	_RAM,131072,4           ## @RAM
.zerofill __DATA,__bss,_GetChar.l,8,3   ## @GetChar.l
.zerofill __DATA,__bss,_GetChar.p,8,3   ## @GetChar.p
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"* "

L_.str.1:                               ## @.str.1
	.asciz	"sectorlisp"

	.comm	_dx,4,2                 ## @dx
	.comm	_cx,4,2                 ## @cx
L_.str.2:                               ## @.str.2
	.space	1

	.section	__TEXT,__const
l_.str.3:                               ## @.str.3
	.asciz	"NIL\000T\000QUOTE\000COND\000ATOM\000CAR\000CDR\000CONS\000EQ"


.subsections_via_symbols
