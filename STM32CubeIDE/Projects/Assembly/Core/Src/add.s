	.syntax unified
	.global add
	.text
add:
	// R0 holds
	LDR R1, =num
	LDR R1, [R1]
	ADD R0, R0, R1
	BX LR
	.data
num:
	.word 10
