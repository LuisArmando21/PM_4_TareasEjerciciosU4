PrinLn MACRO texto
	LOCAL msj	;sebe ser variables locales si se quieren reutilizar 
	.data
	;Area declaracion variables
	
	;msj db "Texto",0
	msj db texto,0

	.code
	;Logica del programa
	push edx	;se respalda edx
	mov edx, offset msj
	call writestring
	call crlf
	pop edx	;se recupera edx para no alterar edx de cara al usuario
ENDM

Print MACRO texto
	LOCAL msj	;sebe ser variables locales si se quieren reutilizar 
	.data
	;Area declaracion variables
	
	;msj db "Texto",0
	msj db texto,0

	.code
	;Logica del programa
	push edx	;se respalda edx
	mov edx, offset msj
	call writestring
	
	pop edx	;se recupera edx para no alterar edx de cara al usuario
ENDM