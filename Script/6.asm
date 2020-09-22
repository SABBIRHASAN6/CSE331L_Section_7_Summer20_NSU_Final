.MODEL SMALL
.STACK 100h
.DATA
    S1 DB " ODD NUMBER$"
    S2 DB " EVEN NUMBER$"
    N DB ?
.CODE
    MOV AX, @DATA
    MOV DS, AX
    MOV AH, 1
    INT 21h
    MOV N, AL
    SUB AL, 30h
    TEST AL, 1h
    JZ EVEN
    JNZ ODD
    EVEN:
        MOV AH, 2
        MOV DL, N
        INT 21h
        MOV AH, 9
        LEA DX, S2
        INT 21h
        JMP EXIT
    ODD:
        MOV AH, 2
        MOV DL, N
        INT 21h
        MOV AH, 9
        LEA DX, S1
        INT 21h
        JMP EXIT
    EXIT:
        MOV AH, 4Ch
        INT 21h