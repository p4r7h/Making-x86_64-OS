mov ah, 0x0e          ; Switches to teletype mode
mov al, 65            ; Moves 65 to al register, which is the capital letter A
int 0x10              ; Calls the BIOS Interrupt, which types out the letter

loop:                 ; A loop

    cmp al, 'Z' + 1   ; Checks if the value in al has reached the specified value, or in this case, a char after Z
    je exit           ; If so, then break out of the loop
    int 0x10          ; Else, call the BIOS Interrupt and type out the letter
    add al, 32        ; This will add 32 to the al register because according to the ASCII Chart, the value difference between uppercase letters and the lowercase letters is different by 32
    int 0x10          ; Call the BIOS Interrupt again and type out the lowercase letter
    sub al, 32        ; Subtracts from al by 32, which will add 1 after the loop starts again
    inc al            ; Decided to put inc al before the jmp because after we subtract 32 from al, it will be still 65
    jmp loop          ; Jumps back into the loop

exit:                 ; Exit Label
    jump $            ; Jump to the current address 

jmp $
times 510 - ($ - $$) db 0
db 0x55, 0xaa
