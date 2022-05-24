TITLE Introduccion

;DESCRPICIÓN
;Objetivo: Archivo de Ejemplo
;
; Autore(s):
; Mtro. Alejandro Garcia
; Su Nombre: Luis Armando Hernández Licea
; Programa #5 – Sumatoria total de una matriz 3 x 3.

; Semestre: 8vo Semestre ISC
;FIN DESCRIPCIÓN

INCLUDE Irvine32.inc

PrintLn_P5 MACRO texto
	LOCAL msj
	.data
	; Área de Declaración de Variables
		;msj db "texto",0 
		msj db texto,0

	.code
	; Lógica del Programa
	mov edx, offset msj
	call writeString

ENDM

.data
; Área de Declaración de Variables
matriz_P5  dword  5,  9,  15
		    dword 20, 50,  3
		    dword 11, 19,  8

tamDato dword 4
t_Filas dword 3
t_Columnas dword 3
suma_P5 dword 0

.code
 main5 PROC
;Lógica del Programa

	mov ecx, 0 ;filas

	ciclofilas:
		push ecx ;se respalda ecx
		mov eax, tamdato
		mul t_Columnas ;se multiplica tamaño del dato por las columnas
		mul ecx ;se multiplica por las filas
		mov esi, eax ;se pasa las filas a esi
		mov ecx, 0 ;se resetea ecx para el ciclo columna
	cicloColumnas:
			mov eax,ecx		;se mueve ecx a eax para multiplicar columna por tamaño dato
			mul tamDato ;
			mov edi, eax	;se mueve a edi el resultado de tamaño dato x columna
			mov eax, matriz_P5[esi+edi] ;se accede a la posicion matriz
			add suma_P5, eax
			inc ecx ;se incrementa ecx correspondiente a columna
			cmp ecx, t_Columnas ;se compara ecx con mamaño columna
	jl cicloColumnas ;salta mientras ecx sea menor al tamalo de las columnas
			pop ecx ;se recupera pop
			inc ecx ;se incrementa ecx correspondiente a filas
			cmp ecx,t_Filas ;se compara la fila actual con el tamaño de las filas
	jl ciclofilas ;salta mientras ecx sea menor al tamaño de las filas
	
	PrintLn_P5 "La sumatoria de la matriz es: "
	mov eax, suma_P5
	call writeDec
	call CrLf

exit
main5 ENDP
END main5