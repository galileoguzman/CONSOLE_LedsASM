m.MODEL SMALL
.STACK
.DATA
 nConta1 dw ?
 nConta2 dw ?
 nLeds   dw ?,'$'
 cPausa  db ?
 nBandera1 db ?
 nBandera2 db ?
 nBandera3 db ?
 nBandera4 db ?
 nBandera5 db ?
 nBandera6 db ?
 nBandera7 db ?
 nBandera8 db ?
 nBandera9 db ?  ;Enciende todos
 nBandera0 db ?  ;Apaga todos
 ;cMensajeOpcion DB 'Elige el motor a encender o apagar','$'
.CODE
 MOV AX,@DATA
 MOV DS,AX
 PUBLIC pEnciendeLeds

pEnciendeLeds PROC FAR
 mov dx,0378h  ;puerto=0378h (LPT1)

 MOV nLeds,00H
 MOV nBandera1,0
 MOV nBandera2,0
 MOV nBandera3,0
 MOV nBandera4,0
 MOV nBandera5,0
 MOV nBandera6,0
 MOV nBandera7,0
 MOV nBandera8,0
 MOV nBandera9,0
 MOV nBandera0,0
.586
eCiclo:
; MOV AH,00H
;  MOV AL,03
; INT 10H

 XOR AX,AX    ;motor a encender (01,02,04,08 / 10,20,40,80)
 OUT DX,AL       ;Enciende motor
PUSHA
 mov dx,0378h  ;puerto=0378h (LPT1)
 mov ax,nLeds    ;motor a encender (01,02,04,08 / 10,20,40,80)
 out dx,al       ;Enciende motor
POPA

 MOV AH,00h
 INT 16H

 CMP AL,'1'
 JE emotor1
 CMP AL,'2'
 JE emotor2
 CMP AL,'3'
 JE emotor3
 CMP AL,'4'
 JE emotor4
 CMP AL,'5'
 JE emotor5
 CMP AL,'6'
 JE emotor6
 CMP AL,'7'
 JE emotor7
 CMP AL,'8'
 JE emotor8
 CMP AL,'0'
 JE emotor0
 CMP AL,'9'
 JE emotor9
 CMP AL,'0'
 JE emotor0
 CMP AL,'S'
 JE eSalir
 CMP AL,'s'
 JE eSalir
 JMP eCiclo

 emotor1:
  CMP nBandera1,0H
  JE eEnciende1
  JMP eApaga1
  eEnciende1:
   MOV nBandera1,01H
   ADD nLeds,01H
   JMP eCiclo
  eApaga1:
   MOV nBandera1,0H
   SUB nLeds,01H
   JMP eCiclo
;----------------------------
 emotor2:
  CMP nBandera2,0H
  JE eEnciende2
  JMP eApaga2
  eEnciende2:
   MOV nBandera2,01H
   ADD nLeds,02H
   JMP eCiclo
  eApaga2:
   MOV nBandera2,0H
   SUB nLeds,02H
   JMP eCiclo
;----------------------------
 emotor3:
  CMP nBandera3,0H
  JE eEnciende3
  JMP eApaga3
  eEnciende3:
   MOV nBandera3,01H
   ADD nLeds,04H
   JMP eCiclo
  eApaga3:
   MOV nBandera3,0H
   SUB nLeds,04H
   JMP eCiclo
;----------------------------
 emotor4:
  CMP nBandera4,0H
  JE eEnciende4
  JMP eApaga4
  eEnciende4:
   MOV nBandera4,01H
   ADD nLeds,08H
   JMP eCiclo
  eApaga4:
   MOV nBandera4,0H
   SUB nLeds,08H
   JMP eCiclo
;----------------------------
;**********************************
 emotor5:
  CMP nBandera5,0H
  JE eEnciende5
  JMP eApaga5
  eEnciende5:
   MOV nBandera5,01H
   ADD nLeds,10H
   JMP eCiclo
  eApaga5:
   MOV nBandera5,0H
   SUB nLeds,10H
   JMP eCiclo
;----------------------------
 emotor6:
  CMP nBandera6,0H
  JE eEnciende6
  JMP eApaga6
  eEnciende6:
   MOV nBandera6,01H
   ADD nLeds,20H
   JMP eCiclo
  eApaga6:
   MOV nBandera6,0H
   SUB nLeds,20H
   JMP eCiclo
;----------------------------
 emotor7:
  CMP nBandera7,0H
  JE eEnciende7
  JMP eApaga7
  eEnciende7:
   MOV nBandera7,01H
   ADD nLeds,40H
   JMP eCiclo
  eApaga7:
   MOV nBandera7,0H
   SUB nLeds,40H
   JMP eCiclo
;----------------------------
 emotor8:
  CMP nBandera8,0H
  JE eEnciende8
  JMP eApaga8
  eEnciende8:
   MOV nBandera8,01H
   ADD nLeds,80H
   JMP eCiclo
  eApaga8:
   MOV nBandera8,0H
   SUB nLeds,80H
   JMP eCiclo
;----------------------------
  emotor9:
   MOV nLeds,255D
   MOV nBandera1,1
   MOV nBandera2,1
   MOV nBandera3,1
   MOV nBandera4,1
   MOV nBandera5,1
   MOV nBandera6,1
   MOV nBandera7,1
   MOV nBandera8,1
   JMP eCiclo
  emotor0:
   MOV nLeds,0000H
   MOV nBandera1,0
   MOV nBandera2,0
   MOV nBandera3,0
   MOV nBandera4,0
   MOV nBandera5,0
   MOV nBandera6,0
   MOV nBandera7,0
   MOV nBandera8,0
   JMP eCiclo
pEnciendeLeds ENDP

;----------------------------
 eSalir:
  MOV DX,0378H  ;puerto=0378h (LPT1)
  XOR AX,AX
  OUT DX,AX ; apaga todos los motores
  MOV AX,4C00H
  INT 21H
END