.MODEL SMALL
.STACK
.DATA
    ARRAY1 DB 30 DUP(?)
    ARRAY2 DB 30 DUP(?)
    MSG DB 10,13,'ENTER THE STRING $'
    MSG1 DB 10,13,'ENTERED STRING IS A PALINDROME $'
    MSG2 DB 10,13,'ENTERED STRING IS NOT A PALINDROME $'
.CODE
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX    ;ADD AN EXTRA SEGMENT

    LEA SI, ARRAY1
    LEA DI, ARRAY2
    MOV CX, 00H

    LEA DX, MSG
    MOV AH,09H
    INT 21H

UP1: MOV AH,01H
     INT 21H

     CMP AL,13
     JZ UP2

     MOV [SI], AL
     INC SI
     INC CX
     JMP UP1

UP2: DEC SI

UP3: MOV AL,[SI]
     MOV [DI],AL
     INC DI
     DEC SI
     JNZ UP3

     LEA SI, ARRAY1
     LEA DI, ARRAY2
     CLD

 REPE CMPSB
        JE PALIN

        LEA DX,MSG2
        MOV AH,09H
        INT 21H

        JMP EXIT

PALIN: LEA DX, MSG1
       MOV AH,09H
       INT 21H

EXIT: MOV AH,4CH
      INT 21H
END
