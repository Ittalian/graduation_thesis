	.file	"code.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.text
	.p2align 4,,15
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	$16, %eax
	movl	%esp, %ebp
	subl	$168, %esp
	andl	$-16, %esp
	call	__alloca
	call	___main
	xorl	%eax, %eax
	.p2align 4,,15
L5:
	movl	%eax, -168(%ebp,%eax,4)
	movl	%eax, -88(%ebp,%eax,4)
	incl	%eax
	cmpl	$19, %eax
	jle	L5
	leave
	ret
