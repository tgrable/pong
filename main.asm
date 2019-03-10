#import "helpers.asm"
#import "consts.asm"
#import "labels.asm"
#import "game_field.asm"
#import "draw_sprite.asm"
#import "joystick_input.asm"

*=$0801

        .byte    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00

*=$0900

main:
    jsr init_game_field

    :draw_score()
    :draw_sprite(%00000001, 25, 51, 1000, $01, 0, 0)
    :draw_sprite(%00000011, 255, 51, 1001, $01, 2, 1)
    
game_loop:
    :handle_joystick_input(joystick_port_1, 1, 1000)
    :handle_joystick_input(joystick_port_2, 3, 1010)
    jmp game_loop

end:


.pc = 64*254
:sprite_row(%000000000000000000000000)
:sprite_row(%000000000000000000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000111111000000000)
:sprite_row(%000000000000000000000000)
:sprite_row(%000000000000000000000000)

