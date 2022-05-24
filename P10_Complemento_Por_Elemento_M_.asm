TITLE Introduccion

;DESCRPICIÓN
;Objetivo: Dada auna matriz donde el maximo de cada elemento 
;es 10 y el minimo 0 calcular el complemento de la matriz para 
;cada elemento (se asume una matriz de 3x3)
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

matriz_P10  dword  5,  1,  6	;fila 0
		    dword 9, 5,  3	;fila 1
		    dword 8, 4,  2	;fila 2

matrizTemp_P10	dword 0,0,0,0	;matriz para los valores a multiplicar 
varcontrol_P19 dword 0			;variable para guardar en posicion la matriz 

tamDatoP10 dword 4
t_FilasP10 dword 3
t_ColumnasP10 dword 3


;posiciones a  a omitir 
saltoF_P10 dword 0
saltoC_P10 dword 0


.code
 main10 PROC
;Lógica del Programa


saltoF:
mov saltoC_P10, 0	;
saltoC:

mov varcontrol_P19, 0
mov ecx, 0 ;filas
	ciclofilas:		
		push ecx ;se respalda ecx
		mov eax, tamdatoP10
		mul t_ColumnasP10		;se multiplica tamaño del dato por las columnas
		mul ecx					;se multiplica por las filas
		mov esi, eax			;se pasa las filas a esi		
		pop ecx					;se recupera control del ciclo filas 
		cmp ecx, saltoF_P10	;	;se compara para sabier si se tiene que omitir dicha fila
		push ecx				;respalda control de filas
		jz salto1		;salta cuando es igual omitiendo el recorrido de la fila 					
		mov ecx, 0				;se resetea ecx para el ciclo columna		
	cicloColumnas:
			cmp ecx, saltoC_P10	;
				jz salto2							;salta cuando sea igual
					mov eax,ecx							;se mueve ecx a eax para multiplicar columna por tamaño dato
					mul tamDatoP10 ;					;se multiplica por tamaño dato
					mov edi, eax						;se mueve a edi el resultado de tamaño dato x columna
					mov eax, matriz_P10[esi+edi]		;se accede a la posicion matriz
					mov edi, varcontrol_P19				;se usa edi para guardar posicion de guadado
					mov matrizTemp_P10[edi], eax		;se guarda en 			
					add varcontrol_P19, 4				;se suma por tamaño dato	
					;call writedec
				salto2:				
			inc ecx							;se incrementa ecx correspondiente a columna
			cmp ecx, t_ColumnasP10			;se compara ecx con mamaño columna
	jl cicloColumnas						;salta mientras ecx sea menor al tamalo de las columnas
		salto1:
		pop ecx							;se recupera pop
		inc ecx							;se incrementa ecx correspondiente a filas
		cmp ecx,t_FilasP10				;se compara la fila actual con el tamaño de las filas
	jl ciclofilas	;salta mientras ecx sea menor al tamaño de las filas
	
	;Calculo determinante submatriz 2x2	
	mov esi, 4
	mov eax, matrizTemp_P10[esi]	
	mov esi, 8
	mul matrizTemp_P10[esi]

	mov ebx, eax	;respalda 

	mov esi, 0
	mov eax, matrizTemp_P10[esi]
	mov esi, 12
	mul matrizTemp_P10[esi]
	
	sub eax, ebx
	
	call writeint 
	Print "	"
	

inc saltoC_P10
mov ecx, saltoC_P10
cmp ecx,3
jl saltoC

call crlf
inc saltoF_P10
mov ecx, saltoF_P10
cmp ecx,3
jl saltoF


exit
main10 ENDP
END main10
