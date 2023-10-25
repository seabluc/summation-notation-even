;====================== CORTEX-M INITIAL CONFIGURATIONS ========================
			THUMB 							; Marks the THUMB mode of operation
StackSize 	EQU		0x00000100				; Define stack size of 256 bytes
			AREA 	STACK, NOINIT, READWRITE, ALIGN=3	
MyStackMem	SPACE	StackSize
			AREA	RESET, READONLY
			EXPORT	__Vectors
__Vectors
			DCD 	MyStackMem + StackSize	; stack ptr empty stack: 0x2000.0100
			DCD		Reset_Handler 			; reset vector 0x0000.0008-0009
			AREA	MYCODE, CODE, READONLY
			ENTRY
			EXPORT 	Reset_Handler
Reset_Handler
;===============================================================================
			MOV		R0, #0	; Initialize value of sum
			MOV		R1, #2	; First even number
			MOV 	R2, #5  ; Counter for the loop iterations
lbegin
			CBZ 	R2, lend ; Compare and Branch if Zero: Branch to lend
			ADD		R0, R1	; Build the sum
			ADD		R1, #2	; Generate the next even number			
			SUB		R2, #1	; Decrement the number
			B		lbegin								 
lend
			B		lend								
			END
