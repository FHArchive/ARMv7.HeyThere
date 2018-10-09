	.global	_start		@ starting address for linker 
_start:	ldr	r1,=msgtxt	@ point to the data to be displayed 
	mov	r2,#10		@ specify the number of bytes in the message (10 bytes in "Hey there\n")
	bl	v_asc		@ call subroutine (branch always?)
	mov 	r0,#0 		@ exit code = normal completion 
	mov 	r7,#1		@ service code to terminate program 
	svc	0		@ linux code to terminate program 

	.data
msgtxt:	.ascii 	"Hey there\n" 	@ 10 char (byte) message 
	.text 

@	subroutine v_asc displays the string 
@		r1 points to the beginning of the string 
@ 		r2 knows the length of the string 
@		lr contains return address
@		registers r0 and r7 is used by the subroutine 

v_asc:	mov	r0,#1		@ code for stdout (standard output... the screen)
	mov	r7,#4		@ the linux command to write the string
	svc	0		@ display the string ( i thought it would be to terminate subroutine... :o)
	bx	lr		@ but it turns out this line does that 
	.end 
