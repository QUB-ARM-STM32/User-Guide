	.syntax unified
	.global reverse_string
	.text
reverse_string:
	// will reverse a string and
	// R0, contains string
	// R1, contains size of string
	// counter that decrements and counter the increments
	// if they equal the same stop
	MOV R2, R0 // up counter
	SUB R1, R1, #2 // sub two, one to account for index and one for the '\0'
	ADD R3, R2, R1 // down counter
loop:
	LDRB R4, [R2] // load first char
	LDRB R5, [R3] // load last char
	STRB R5, [R2] // put first char into position of last
	STRB R4, [R3] // put last char into position of first
	SUB R3, R3, #1
	ADD R2, R2, #1
	CMP R3, R2
	BGT loop
	BX LR
