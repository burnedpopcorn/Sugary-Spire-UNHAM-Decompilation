scream_index += 0.35
pal_swap_set(spr_palette, paletteselect, 0)
draw_sprite_ext(drawsprite, drawimage, x, y, (xscale * scale_xs), (yscale * scale_ys * machrollyscale), draw_angle, image_blend, image_alpha)
var near = instance_nearest(x, y, obj_hotcaramel)
if (instance_nearest(x, y, obj_hotcaramel) < instance_nearest(x, y, obj_siren) && global.panic)
    near = instance_nearest(x, y, obj_siren)
var dis = distance_to_object(near)
var darkalpha = dis / 150
if (near == instance_nearest(x, y, obj_siren))
    darkalpha = dis / 250
if ((room == mines_11 || room == mines_12) && global.darkmines)
{
    shader_set(shd_mines)
    var colorblend1 = shader_get_uniform(shd_mines, "blendcolor1")
    shader_set_uniform_f(colorblend1, 0, 0, 0)
    var colorblend2 = shader_get_uniform(shd_mines, "blendcolor2")
    shader_set_uniform_f(colorblend2, 0.08627450980392157, 0.23529411764705882, 0.4666666666666667)
    draw_sprite_ext(drawsprite, drawimage, x, y, (xscale * scale_xs), (yscale * scale_ys * machrollyscale), draw_angle, image_blend, darkalpha)
    shader_reset()
}
if (key_shoot && character == "N" && drawsprite == sprite_index)
{
    if (state != states.fling && state != states.cotton && state != states.cottondrill && state != states.cottonroll && state != states.door && state != states.ladder && state != states.keyget && state != states.drown && sprite_index != spr_pizzano_candybegin && sprite_index != spr_pizzano_candyidle && sprite_index != spr_pizzano_candytransitionup && sprite_index != spr_pizzano_candyup && room != rm_credits && room != realtitlescreen && room != rm_verify && room != rank_room && room != palroom && room != scootercutsceneidk && sprite_index != spr_pizzano_deathend && sprite_index != spr_pizzano_sleep && sprite_index != spr_pizzano_sleepend && sprite_index != spr_pizzano_outofcontrolfall && sprite_index != spr_pizzano_bodyslamprep && sprite_index != spr_pizzano_bodyslamfall && sprite_index != spr_pizzano_superjumpland && state != states.uppercut && state != states.pizzano && sprite_index != spr_pizzano_taunt && sprite_index != spr_pizzano_supertaunt1 && sprite_index != spr_pizzano_mach3hitwallair && sprite_index != spr_pizzano_minecartspin && sprite_index != spr_pizzano_minecartjump && sprite_index != spr_pizzano_djump && sprite_index != spr_pizzano_eatdonut && sprite_index != spr_pizzano_hurt && sprite_index != spr_pizzano_sleepstart && sprite_index != spr_pizzano_fireass && sprite_index != spr_pizzano_fireassend && sprite_index != spr_pizzano_noclip && (xscale == 1 || xscale == -1) && (!instance_exists(obj_titlecard)) && (!instance_exists(obj_layoutselect)))
    {
        switch sprite_index
        {
            case spr_pizzano_crouchslide:
                xhead = -5
                yhead = -5
                break
            case spr_pizzano_mach3boost:
            case spr_pizzano_mach3boostfall:
                xhead = 12
                yhead = 10
                break
            case spr_pizzano_mach3grounded:
                xhead = -5
                yhead = 10
                break
            case spr_pizzano_wallclimb:
                xhead = 12
                yhead = 12
                break
            case spr_pizzano_twirl:
                xhead = 0
                yhead = 14
                break
            case spr_pizzano_machfall:
                xhead = 5
                yhead = 10
                break
            case spr_pizzano_machboost:
            case spr_pizzano_machboostfall:
                xhead = 7
                yhead = 10
                break
            case spr_pizzano_crazyrun:
                xhead = -3
                yhead = -3
                break
            case spr_pizzano_rollgetup:
                xhead = 0
                yhead = -5
                break
            case spr_pizzano_mach2:
                xhead = -8
                yhead = 5
                break
            case spr_pizzano_mach1:
                xhead = 10
                yhead = 10
                break
            case spr_pizzano_wallsplat:
                xhead = -5
                yhead = 0
                break
            case spr_pizzano_bodyslamland:
            case spr_pizzano_poundcancelland:
                xhead = 0
                yhead = -3
                break
            case spr_pizzano_poundcancel:
            case spr_pizzano_poundcancelprep:
                xhead = 3
                yhead = 30
                break
            case spr_pizzano_ceilingcrash:
                xhead = 10
                yhead = 10
                break
            case spr_pizzano_sjumpprep:
            case spr_pizzano_sjumpprep:
            case spr_pizzano_sjumppreplight:
            case spr_pizzano_sjumpprepleft:
            case spr_pizzano_sjumpprepright:
                xhead = -10
                yhead = -15
                break
            case spr_pizzano_sjumpprepside:
                xhead = 15
                yhead = 10
                break
            case spr_pizzano_crouchstart:
            case spr_pizzano_crouch:
            case spr_pizzano_crouchjump:
            case spr_pizzano_crouchfall:
            case spr_pizzano_crawl:
                xhead = -8
                yhead = -5
                break
            case spr_pizzano_hurt:
                xhead = 5
                yhead = 10
                break
            case spr_pizzano_minecart:
            case spr_pizzano_minecartland:
                xhead = -2
                yhead = 44
                break
            case spr_pizzano_minecartfall:
                xhead = 25
                yhead = 51
                break
            case spr_pizzano_minecartfast:
            case spr_pizzano_minecartfastland:
                xhead = 12
                yhead = 44
                break
            case spr_pizzano_eatdonut:
                xhead = -3
                yhead = 10
                break
            case spr_pizzano_mach3slide:
                xhead = 10
                yhead = -15
                break
            case spr_pizzano_jump:
                if (drawimage < 1)
                {
                    xhead = 0
                    yhead = -10
                }
                else
                {
                    xhead = 0
                    yhead = 10
                }
                break
            case spr_pizzano_land:
            case spr_pizzano_land2:
                if (drawimage == 0)
                {
                    xhead = 0
                    yhead = -6
                }
                else if (drawimage > 0 && drawimage < 3)
                {
                    xhead = 0
                    yhead = 1
                }
                else
                {
                    xhead = 0
                    yhead = 7
                }
                break
            default:
                xhead = 0
                yhead = 10
                break
        }

        var headrandom1 = irandom_range(1, -1)
        var headrandom2 = irandom_range(1, -1)
        pal_swap_set(spr_palette, paletteselect, 0)
        draw_sprite_ext(spr_pizzano_scream, scream_index, (x - xhead * (xscale * scale_xs) + headrandom1), (y - yhead * (yscale * scale_ys * machrollyscale) + headrandom2), (xscale * scale_xs), (yscale * scale_ys * machrollyscale), draw_angle, image_blend, image_alpha)
        if ((room == mines_11 || room == mines_12) && global.darkmines)
        {
            shader_set(shd_mines)
            colorblend1 = shader_get_uniform(shd_mines, "blendcolor1")
            shader_set_uniform_f(colorblend1, 0, 0, 0)
            colorblend2 = shader_get_uniform(shd_mines, "blendcolor2")
            shader_set_uniform_f(colorblend2, 0.08627450980392157, 0.23529411764705882, 0.4666666666666667)
            draw_sprite_ext(spr_pizzano_scream, scream_index, (x - xhead * (xscale * scale_xs) + headrandom1), (y - yhead * (yscale * scale_ys * machrollyscale) + headrandom2), (xscale * scale_xs), (yscale * scale_ys * machrollyscale), draw_angle, image_blend, darkalpha)
            shader_reset()
        }
        if flash
        {
            shader_set(shd_hit)
            draw_sprite_ext(spr_pizzano_scream, scream_index, (x - xhead * (xscale * scale_xs) + headrandom1), (y - yhead * (yscale * scale_ys * machrollyscale) + headrandom2), (xscale * scale_xs), (yscale * scale_ys * machrollyscale), draw_angle, image_blend, image_alpha)
            shader_reset()
        }
    }
}
shader_reset()
if ((state == states.cotton || state == states.cottondrill || state == states.cottonroll) && drawsprite != sprite_index)
{
    var cottonfog = make_colour_rgb(255, 139, 220)
    if (character == "N")
        cottonfog = make_colour_rgb(48, 168, 248)
    gpu_set_fog(true, cottonfog, 1, 1)
    draw_sprite_ext(drawsprite, drawimage, x, y, (xscale * scale_xs), (yscale * scale_ys * machrollyscale), draw_angle, image_blend, 0.65)
    gpu_set_fog(false, c_white, 0, 0)
}
if flash
{
    shader_set(shd_hit)
    draw_sprite_ext(drawsprite, drawimage, x, y, (xscale * scale_xs), (yscale * scale_ys * machrollyscale), draw_angle, image_blend, image_alpha)
    shader_reset()
}
if (flash && alarm[11] <= 0)
    alarm[11] = 5
shader_reset()
if global.debugmode
{
    draw_set_font(font_dev)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    draw_text(x, (y - 50), ("State: " + string(state) + ", " + string(stateName)))
    draw_text(x, (y - 100), movespeed)
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
    draw_set_halign(fa_left)
}
