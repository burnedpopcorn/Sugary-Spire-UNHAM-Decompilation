if (sprite_index == spr_juicedead || sprite_index == spr_juicepuddledebris)
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
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    pal_swap_reset()
}
else
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
