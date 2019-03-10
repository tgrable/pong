.importonce 


.macro handle_joystick_input(joystick, yPosOffset, spritePosMemoryLocation) {
    lda joystick
    and #JOY_UP
    bne down_check
up_action:
    :dely()
    ldy spritePosMemoryLocation
    dey
    cpy #$30
    beq end
    sty sprites.postition + yPosOffset
    sty spritePosMemoryLocation
    jmp end
down_check:
    lda joystick
    and #JOY_DOWN
    bne end
down_action:
    :dely()
    ldy spritePosMemoryLocation
    iny
    cpy #$d2
    beq end
    sty sprites.postition + yPosOffset
    sty spritePosMemoryLocation
end:
}