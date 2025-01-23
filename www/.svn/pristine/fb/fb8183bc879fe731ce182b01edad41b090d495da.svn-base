	.file	"code.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.text
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$200, %esp
	andl	$-16, %esp
	movl	$0, %eax
	addl	$15, %eax
	addl	$15, %eax
	shrl	$4, %eax
	sall	$4, %eax
	movl	%eax, -188(%ebp)
	movl	-188(%ebp), %eax
	call	__alloca
	call	___main
	movl	$0, -172(%ebp)
L2:
	cmpl	$19, -172(%ebp)
	jg	L3
	movl	-172(%ebp), %ecx
	movl	-172(%ebp), %edx
	movl	-172(%ebp), %eax
	movl	%eax, -168(%ebp,%edx,4)
	movl	%eax, -88(%ebp,%ecx,4)
	leal	-172(%ebp), %eax
	incl	(%eax)
	jmp	L2
L3:
	leave
	ret
