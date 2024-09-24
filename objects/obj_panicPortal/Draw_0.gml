draw_self()
scale = image_index / 8
color = make_color_hsv(0, 0, (scale * 255))
if (floor(image_index) < 8)
{
    if (drawSprite == spr_juicewalk)
    {
        switch global.levelname
        {
            case "entryway":
            case "entrywaysecret":
                var _pal = 1
                break
            case "steamy":
            case "steamysecret":
                _pal = 2
                break
            case "molasses":
            case "molassessecret":
                _pal = 3
                break
            case "mines":
            case "minessecret":
                _pal = 4
                break
            default:
                _pal = 0
                break
        }

        pal_swap_set(spr_juicePalette, _pal, false)
        draw_sprite_ext(drawSprite, -1, x, y, (scale * sign(drawXscale)), scale, image_angle, color, image_alpha)
        pal_swap_reset()
    }
    else
        draw_sprite_ext(drawSprite, -1, x, y, (scale * sign(drawXscale)), scale, image_angle, color, image_alpha)
}
