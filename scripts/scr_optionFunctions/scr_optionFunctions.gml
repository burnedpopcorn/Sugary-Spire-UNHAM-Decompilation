function draw_option(argument0, argument1, argument2, argument3)
{
    draw_set_color(c_white);
    
    if (argument3 == 0)
        draw_set_color(#666666);
    
    draw_text(argument0, argument1, argument2);
    draw_set_color(c_white);
}
