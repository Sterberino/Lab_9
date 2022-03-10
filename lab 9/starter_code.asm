.orig x3000
;this stack lab computes the polish notation of a set of calls
LD R6, stack_addr
LD R5, push_val_addr

;push_val(4) pushes the value 4 onto the stack [4]
AND R1, R1, #0
ADD R1, R1, #4
JSRR R5

;push_val(3) pushes the value 3 onto the stack [4,3]
AND R1, R1, #0
ADD R1, R1, #3
JSRR R5


;push_val(2) pushes the value 2 onto the stack [4,3,2]
AND R1, R1, #0
ADD R1, R1, #2
JSRR R5


LD R5, add_val_addr
;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
AND R0, R0, #0
AND R4, R4, #0

JSRR R5
ADD R4, R4, R0



;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
JSRR R5
AND R4, R4, #0
ADD R4, R4, R0

AND R5, R5, #0


HALT

; Stack address ** DO NOT CHANGE **
stack_addr           .FILL    xFE00
push_val_addr        .FILL    x3400
add_val_addr        .FILL    x3800 
;move the top value of the stack into r4
.end




;---------------------------------------------------------------------------------
; push_val()
;
;parameter: R1 - the value to be pushed to the stack, R6 - Stack address(not to be changed)
;
;returns: N/A
;---------------------------------------------------------------------------------
.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack
    ADD R6, R6, #-1
    STR R1, R6, #0 



    RET
.end


;---------------------------------------------------------------------------------
; add_val()
;
;parameter: R6 - Stack address (not to be changed)
;
;returns: R0 (value of top two stack values)
;---------------------------------------------------------------------------------
.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack
    ST R1, BACKUP_R1_3400
    ST R2, BACKUP_R2_3400
    ST R3, BACKUP_R3_3400
    
    
    LDR R1, R6, #0
    ADD R6, R6, #1
    

    LDR R2, R6, #0
    ADD R6, R6, #1
    
    ADD R0, R1, R2
    
    ADD R6, R6, #-1
    STR R0, R6, #0 

    
    LD R1, BACKUP_R1_3400
    LD R2, BACKUP_R2_3400  
    LD R3, BACKUP_R3_3400
    
    RET
   
    push_val_addr_3400        .FILL    x3400
    BACKUP_R1_3400 .BLKW #1
    BACKUP_R2_3400 .BLKW #1
    BACKUP_R3_3400 .BLKW #1
.end



.orig x4200 ;;data you might need

.end


