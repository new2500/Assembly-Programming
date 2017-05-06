ST1_SEG    SEGMENT   STACK
    STACK_BUF  DW        120  DUP  (?)
    TOP        DW        0
ST1_SEG    ENDS
;------------------------------
DATA1_SEG     SEGMENT   
M_Num		DB      20
IN_Ch_Num    DB        ?
Str1        DB        20 DUP (?)
CR          DB        0AH,0DH,'the num of input chars is $'              
DATA1_SEG     ENDS
CODE1_SEG     SEGMENT  
;------------------------------------------------------
MAIN          PROC      FAR
              ASSUME    CS:CODE1_SEG,DS:DATA1_SEG
              ASSUME    SS:ST1_SEG
START:        
              MOV       AX,ST1_SEG
              MOV       SS,AX
              MOV       SP,OFFSET TOP
              MOV       AX,DATA1_SEG
              MOV       DS,AX
              MOV       DX,OFFSET M_Num
              MOV       AH,0AH
              INT       21H
              MOV       DX,OFFSET CR
              MOV       AH,09
              INT       21H
              MOV       BL,IN_Ch_Num
              MOV       BH,0
              MOV       DX,OFFSET Str1
              MOV       SI,DX
              MOV       [SI+BX],BYTE PTR'$'
              OR        BL,30H
              MOV       IN_Ch_Num,BL
              MOV       DX,OFFSET IN_Ch_Num
              MOV       AH,09h
              INT       21h
              MOV       AH,01
              INT       21H
              MOV       AH,4CH
              INT       21H      
MAIN          ENDP      
CODE1_SEG     ENDS
 END       START    ;end
