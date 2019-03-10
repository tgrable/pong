.importonce

.label kernal_chrout    = $ffd2
.label top_line         = $0400
.label bottom_line      = $07C1
.label top_character    = $0078
.label bottom_character = $0079
.label joystick_port_1 = $dc01
.label joystick_port_2 = $dc00

.namespace sprites {
    .label postition    = VIC2
    .label enabled_bits = VIC2 + 21
    .label colors = VIC2 + 39
    .label pointers = $0400 + 1024 - 8
    .label vertical_stretch_bits = VIC2 + 23
}