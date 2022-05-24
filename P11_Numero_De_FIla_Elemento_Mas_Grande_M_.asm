TITLE Introduccion

;DESCRPICIÓN
;Objetivo: Imrpimir el numero de la fila donde se encuentre el valor mas grande 
;
; Autore(s):
; Mtro. Alejandro Garcia
; Alumo 
;

; Semestre: 8vo Semestre ISC
;FIN DESCRIPCIÓN

INCLUDE Irvine32.inc
INCLUDE LibreriaMacros.inc

.data
; Área de Declaración de Variables
matriz_P11  dword  5,  90,  15	;fila 0
		    dword 20, 50,  3	;fila 1
		    dword 11, 19,  8	;fila 2

tamDatoP11 dword 4
t_FilasP11 dword 3
t_ColumnasP11 dword 3
P_filaP11 dword 0
datoP11 dword 0
.code
 main11 PROC
;Lógica del Programa
mov esi, 0
mov edi, 0
mov eax, matriz_P11[esi+edi]
mov datoP11, eax


mov ecx, 0 ;filas

	ciclofilas:
		push ecx ;se respalda ecx
		mov eax, tamdatoP11
		mul t_ColumnasP11		;se multiplica tamaño del dato por las columnas
		mul ecx					;se multiplica por las filas
		mov esi, eax			;se pasa las filas a esi
		mov ecx, 0				;se resetea ecx para el ciclo columna
	cicloColumnas:
			mov eax,ecx								;se mueve ecx a eax para multiplicar columna por tamaño dato
			mul tamDatoP11 ;
			mov edi, eax							;se mueve a edi el resultado de tamaño dato x columna
			mov eax, matriz_P11[esi+edi]			;se accede a la posicion matriz
		cmp datoP11, eax
		jg mayor
			mov datoP11, eax
			mov eax, esi
			div tamDatoP11
			div t_FilasP11
			mov P_filaP11, eax
		mayor:

			inc ecx							;se incrementa ecx correspondiente a columna
			cmp ecx, t_ColumnasP11			;se compara ecx con mamaño columna
	jl cicloColumnas						;salta mientras ecx sea menor al tamalo de las columnas
			pop ecx							;se recupera pop
			inc ecx							;se incrementa ecx correspondiente a filas
			cmp ecx,t_FilasP11				;se compara la fila actual con el tamaño de las filas
	jl ciclofilas							;salta mientras ecx sea menor al tamaño de las filas
	
	Print "Fila del numero mayor: "
	mov eax, P_filaP11	
	call writedec


exit
main11 ENDP
END main11
