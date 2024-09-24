var drawx = x
var drawy = y
var xscale = (abs(image_xscale) + squashval) * sign(image_xscale)
var yscale = image_yscale - squashval
if (shakebuffer > 0)
    shakebuffer--
else
    angryindex = 0
if (shakebuffer > 0)
{
    drawx += random_range((-shake), shake)
    drawy += random_range((-shake), shake)
}
if (object_index == obj_googlyjuice)
{
    switch global.levelname
    {
        case "entryway":
        case "entrywaysecret":
            var _pal = 1
            break
        case "steamy":
        case "steamysecret":
        case "entrywaynew":
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
    draw_sprite_ext(sprite_index, image_index, drawx, (drawy + 46 * squashval), xscale, yscale, image_angle, image_blend, image_alpha)
    pal_swap_reset()
}
else if (object_index == obj_gumslime)
{
    pal_swap_set(spr_pinkypalette, pinky, false)
    draw_sprite_ext(sprite_index, image_index, drawx, (drawy + 46 * squashval), xscale, yscale, image_angle, image_blend, image_alpha)
    pal_swap_reset()
}
else
    draw_sprite_ext(sprite_index, image_index, drawx, (drawy + 46 * squashval), xscale, yscale, image_angle, image_blend, image_alpha)
if ((room == mines_11 || room == mines_12) && global.darkmines)
{
    var near = instance_nearest(x, y, obj_hotcaramel)
    if (instance_nearest(x, y, obj_hotcaramel) < instance_nearest(x, y, obj_siren) && global.panic)
        near = instance_nearest(x, y, obj_siren)
    var dis = distance_to_object(near)
    var darkalpha = dis / 100
    if (near == instance_nearest(x, y, obj_siren))
        darkalpha = dis / 200
    shader_set(shd_mines)
    var colorblend1 = shader_get_uniform(shd_mines, "blendcolor1")
    shader_set_uniform_f(colorblend1, 0, 0, 0)
    var colorblend2 = shader_get_uniform(shd_mines, "blendcolor2")
    shader_set_uniform_f(colorblend2, 0.08627450980392157, 0.23529411764705882, 0.4666666666666667)
    draw_sprite_ext(sprite_index, image_index, drawx, (drawy + 46 * squashval), xscale, yscale, image_angle, image_blend, image_alpha)
    shader_reset()
}
if flash
{
    shader_set(shd_hit)
    draw_sprite_ext(sprite_index, image_index, drawx, (drawy + 46 * squashval), xscale, yscale, image_angle, image_blend, image_alpha)
    shader_reset()
}
if cottoned
{
    gpu_set_fog(true, 0xFE8AFF, 1, 1)
    draw_sprite_ext(sprite_index, image_index, drawx, (drawy + 46 * squashval), xscale, yscale, image_angle, image_blend, 0.6)
    gpu_set_fog(false, c_white, 0, 0)
}
if global.debugmode
{
    draw_set_font(font_dev)
    draw_text(x, (y - 50), state)
    draw_text(x, (y - 150), movespeed)
    if (object_index == obj_cottonwitch)
        draw_text(x, (y - 100), bombreset)
    if (object_index == obj_sluggy)
    {
        draw_text(x, (y - 100), idletimer)
        draw_text(x, (y - 150), jumptimer)
    }
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
}
if (shakebuffer > 0)
{
    angryindex += 0.35
    if (floor(angryindex) == (sprite_get_number(spr_angrycloud) - 1))
        frac(angryindex)
    draw_sprite_ext(spr_angrycloud, angryindex, x, y, 1, 1, image_angle, image_blend, image_alpha)
}
