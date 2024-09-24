draw_set_color(c_black)
draw_rectangle(-64, -64, 960, 540, false)
if start
{
    draw_sprite(titlecard_sprite, titlecard_index, titlecardx, 0)
    var s = 1
    draw_sprite(title_sprite, title_index, titlecardtitlex, (titlecardtitley + bobbingtitle))
    for (var i = 0; i < array_length(noisehead); i++)
    {
        var head = noisehead[i]
        if (!head.visible)
        {
        }
        else
        {
            head.visual_scale = approach(head.visual_scale, 1, 0.25)
            draw_sprite_ext(spr_pizzano_stickers, head.image_index, (head.x + titlecardx), (head.y + titlecardy), (head.scale * head.visual_scale), (head.scale * head.visual_scale), 0, c_white, 1)
        }
    }
}
if (!instance_exists(obj_fadeout))
    draw_set_alpha(fadealpha)
else
    draw_set_alpha(obj_fadeout.fadealpha)
draw_set_alpha(1)
bobbingtitle = wave(3, -3, 2, 0)
