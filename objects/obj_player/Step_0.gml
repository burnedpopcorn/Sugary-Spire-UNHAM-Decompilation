scr_getinput()
scr_characterspr()
scr_playerstate()
if (state != states.comingoutdoor)
    image_blend = make_color_hsv(0, 0, 255)
if (firetrailbuffer > 0)
    firetrailbuffer -= (movespeed / 24 * 26)
if (firetrailbuffer <= 0)
{
    if (movespeed >= 12 && grounded && vsp > 0 && (state == states.mach2 || state == states.mach3 || state == states.machroll))
        instance_create(x, y, obj_flamecloud)
    firetrailbuffer = 100
}
if global.playerrotate
{
    if (grounded && vsp >= 0 && (!((state == states.climbwall || state == states.tumble || state == states.grab || state == states.freefallland || state == states.shotgun || state == states.finishingblow || state == states.minecart || state == states.minecartspin))))
    {
        if (abs(hsp) >= 8)
        {
            var targetangle = scr_slopeangle()
            var RotationStep = (abs(hsp) / 16 + abs(hsp) / 32 - 2) * -1
        }
        else
        {
            targetangle = 360
            RotationStep = (abs(hsp) / 16 - 2) * -1
        }
        draw_angle = darctan2((dsin(targetangle) + dsin(draw_angle) * RotationStep), (dcos(targetangle) + dcos(draw_angle) * RotationStep))
    }
    else
    {
        if (draw_angle <= 0)
            draw_angle += 360
        if (draw_angle < 180)
            draw_angle = max((draw_angle - 2.8125), 0)
        else
            draw_angle = min((draw_angle + 2.8125), 360)
    }
}
if (room == realtitlescreen || room == scootercutsceneidk)
    state = states.titlescreen
if grounded
    groundedcot = true
if (state != states.gameover && state != states.noclip && (y > (room_height + 192) || y < -192) && (!(place_meeting(x, y, obj_vertical_hallway))) && (!instance_exists(obj_fadeout)) && room != outer_room2 && room != realtitlescreen && (!instance_exists(obj_warphallway)))
{
    if (!instance_exists(obj_technicaldifficulty))
        instance_create(x, y, obj_technicaldifficulty)
    if instance_exists(obj_train)
    {
        with (obj_train)
        {
            x = xstart
            y = ystart
            movespeed = 10
            image_index = 0
            sprite_index = spr_spray
            go = false
        }
    }
    state = states.hurt
    alarm[8] = 60
    alarm[7] = 120
    hurted = 1
    sprite_index = spr_hurt
    movespeed = 0
    vsp = -3
    visible = false
    global.combofreeze = 60
}
if (state != states.freefall && state != states.freefallprep && state != states.freefallland)
    freefallsmash = 0
if ((!instance_exists(baddiegrabbedID)) && (state == states.grab || (state == states.superslam && sprite_index != spr_piledriverland) || state == states.charge))
    state = states.normal
if (!((state == states.grab || state == states.charge || state == states.superslam || state == states.finishingblow)))
    baddiegrabbedID = -4
if (character == "P")
{
    if (anger == 0)
        angry = false
    if (anger > 0)
    {
        angry = true
        anger -= 1
    }
}
if (character == "P")
{
    if ((angry == 1 || global.combo >= 25) && sprite_index == spr_idle && global.combo < 50)
        sprite_index = spr_player_3hpidle
    else if (global.combo >= 50 && sprite_index == spr_idle)
        sprite_index = spr_playerPZ_rageidle
}
if instance_exists(obj_oneway)
{
    if instance_exists(obj_oneway.solidid)
    {
        if place_meeting((x + xscale), y, obj_oneway.solidid)
        {
            if ((state == states.mach3 && grounded) || state == states.machtumble)
            {
                scr_sound(sound_bump)
                with (obj_camera)
                {
                    shake_mag = 20
                    shake_mag_acc = 40 / room_speed
                }
                image_speed = 0.35
                with (obj_baddie)
                {
                    if (point_in_camera(x, y, view_camera[0]) && grounded)
                    {
                        stun = 1
                        alarm[0] = 200
                        ministun = 0
                        vsp = -5
                        hsp = 0
                    }
                }
                flash = 0
                combo = 0
                scr_sound(sound_maximumspeedland)
                if (character == "N")
                    sprite_index = spr_pizzano_mach3hitwall
                else
                    sprite_index = spr_player_mach3hitwall
                state = states.bump
                hsp = -2.5 * xscale
                vsp = -3
                mach2 = 0
                image_index = 0
                instance_create((x + 10 * xscale), (y + 10), obj_bumpeffect)
            }
            else if (state == states.machroll || (state == states.mach2 && grounded) || (state == states.crouchslide && sprite_index == spr_player_machslide) || (state == states.machslide && (sprite_index == spr_machslidestart || sprite_index == spr_machslideend || sprite_index == spr_playerPZ_machslide)))
            {
                if (character == "N")
                    sprite_index = spr_pizzano_wallsplat
                else
                    sprite_index = spr_playerPZ_wallsplat
                state = states.bump
                movespeed = 0
            }
            else if (state == states.handstandjump)
            {
                grav = 0.5
                movespeed = 0
                state = states.bump
                vsp = -4
                mach2 = 0
                image_index = 0
                machslideAnim = 1
                machhitAnim = 0
                sprite_index = spr_playerPZ_suplexbump
                instance_create((x + 10 * xscale), (y + 10), obj_bumpeffect)
                if audio_is_playing(sound_suplex1)
                    audio_stop_sound(sound_suplex1)
                scr_sound(sound_bump)
            }
            else if ((state == states.mach3 || state == states.mach2) && (!grounded))
            {
                wallspeed = movespeed
                machhitAnim = 0
                state = states.climbwall
            }
            else if (state == states.rocketfistpizzano)
            {
                scr_sound(sound_maximumspeedland)
                with (obj_camera)
                {
                    shake_mag = 20
                    shake_mag_acc = 40 / room_speed
                }
                image_speed = 0.35
                with (obj_baddie)
                {
                    if (point_in_camera(x, y, view_camera[0]) && grounded)
                    {
                        stun = true
                        alarm[0] = 200
                        ministun = false
                        vsp = -5
                        hsp = 0
                    }
                }
                vsp = -6
                hsp = -6 * xscale
                image_index = 0
                sprite_index = spr_pizzano_mach3hitwallair
                state = states.bump
            }
        }
    }
}
scr_playersounds()
if (state == states.machroll)
{
    if (!audio_is_playing(sound_tumble))
        scr_sound(sound_tumble)
}
else
    audio_stop_sound(sound_tumble)
if (sprite_index == spr_player_winding && state != states.normal)
    windingAnim = 0
else
    audio_stop_sound(sound_superjumpcharge2)
if (state == states.cottonroll && sprite_index == spr_cotton_run)
{
    if (!audio_is_playing(sound_customdash1))
        scr_sound(sound_customdash1)
}
else
    audio_stop_sound(sound_customdash1)
if (state == states.cottonroll && sprite_index == spr_cotton_maxrun)
{
    if (!audio_is_playing(sound_customdash2))
        scr_sound(sound_customdash2)
}
else
    audio_stop_sound(sound_customdash2)
if (suplexmove && grounded)
{
    suplexmove = false
    flash = true
}
if (obj_player.state != states.handstandjump && state != states.drown)
    grav = 0.5
if (state != states.normal)
    breakdance_speed = 0.25
if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    instance_create((x + (random_range(-5, 5))), (y + 46), obj_vomit)
if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (instance_create((x + (random_range(-5, 5))), (y + 46), obj_vomit))
        sprite_index = spr_vomit2
}
if (angry && (!instance_exists(obj_angrycloud)) && obj_player.state == states.normal)
    instance_create(x, y, obj_angrycloud)
global.combotime = clamp(global.combotime, 0, 60)
if (global.combofreeze <= 0)
    global.combotime = approach(global.combotime, 0, 0.125)
if ((global.combo % 3) == 0 && playComboVariable != global.combo && global.combotime > 0 && global.combo > 0)
    playComboVariable = global.combo
global.combofreeze--
global.combofreeze = clamp(global.combofreeze, 0, 75)
if (global.combotime <= 0 && global.combo != 0)
{
    if (global.combo > 5)
        scr_queue_tvanim(obj_tv.happytvspr, 50)
    if (global.maxcombo < global.combo)
        global.maxcombo = global.combo
    global.savedcombo = global.combo
    with (instance_create(x, y, obj_comboend))
    {
        combo = global.savedcombo
        comboscore = global.comboscore
        comboscoremax = comboscore
        combominus = round(comboscore / 50)
    }
    global.comboscore = 0
    global.savedcombo = 0
    global.combo = 0
    playComboVariable = -4
    global.combodropped = 1
}
if (input_buffer_jump < 8)
    input_buffer_jump++
if (input_buffer_secondjump < 8)
    input_buffer_secondjump++
if (input_buffer_highjump < 8)
    input_buffer_highjump++
if (input_buffer_slap < 8)
    input_buffer_slap++
if key_particles
    instance_create(random_range((x + 25), (x - 25)), random_range((y + 35), (y - 25)), obj_keyeffect)
if (inv_frames == 0 && (!hurted))
    image_alpha = 1
if (state == states.mach2 || state == states.charge || state == states.skateboard || state == states.knightpep || state == states.boxxedpep || state == states.cheesepep || state == states.knightpepslopes || state == states.knightpepattack || state == states.bombpep || state == states.facestomp || state == states.shotgun || state == states.facestomp || (state == states.machroll && (sprite_index == spr_playerPZ_backslideland || sprite_index == spr_playerPZ_backslide || character == "N") && movespeed >= 12) || state == states.mach3 || state == states.freefall || state == states.Sjump)
    attacking = true
else
    attacking = false
if (state == states.throwing || state == states.punch || state == states.backkick || state == states.shoulder || state == states.uppunch)
    grabbing = true
else
    grabbing = false
if (state == states.mach3 || state == states.machtumble || state == states.minecart || state == states.minecartspin || state == states.fireass || state == states.puddle || state == states.hookshot || state == states.skateboard || state == states.timesup || state == states.freefall || state == states.Sjump || state == states.shotgun || state == states.charge || (state == states.superslam && sprite_index == spr_piledriver) || (state == states.superslam && sprite_index == spr_player_piledriverstart) || state == states.knightpep || state == states.knightpepattack || state == states.knightpepslopes || state == states.boxxedpep || state == states.cheesepep || state == states.cheeseball || state == states.cottonroll || (state == states.cotton && (sprite_index == spr_cottonPizzano_drillup || sprite_index == spr_cottonPizzano_wallclimb || sprite_index == spr_cottonPizzano_fastfall || sprite_index == spr_cottonPizzano_jumpwall)) || state == states.pizzano || sprite_index == spr_pizzano_spincancel || sprite_index == spr_pizzano_mach3boost || sprite_index == spr_playerPZ_machslideboost3 || (state == states.jump && (sprite_index == spr_playerPZ_scooterspin || sprite_index == spr_playerPZ_scooterspinstart || sprite_index == spr_pizzano_wallclimbspin)) || (state == states.climbwall && movespeed > 10) || (state == states.machroll && (sprite_index == spr_playerPZ_backslideland || sprite_index == spr_playerPZ_backslide || character == "N") && movespeed >= 12))
    instakillmove = true
else
    instakillmove = false
if (flash && alarm[0] <= 0)
    alarm[0] = 0.15 * room_speed
if (state != states.mach3 && state != states.machslide)
    autodash = false
if ((state != states.jump && state != states.crouchjump && state != states.slap) || vsp < 0)
    fallinganimation = false
if (state != states.freefallland && state != states.normal && state != states.machslide)
    facehurt = 0
if (state != states.normal && state != states.machslide)
    machslideAnim = false
if (state != states.normal)
{
    idle = 0
    dashdust = false
}
if (state != states.mach1 && state != states.jump && state != states.hookshot && state != states.handstandjump && state != states.normal && state != states.mach2 && state != states.mach3 && state != states.freefallprep && state != states.knightpep && state != states.shotgun && state != states.knightpepslopes)
    momemtum = false
if (state != states.Sjump && state != states.Sjumpprep)
    a = 0
if (state != states.facestomp)
    facestompAnim = false
if (state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefallland)
    superslam = 0
if (state != states.mach2)
    machpunchAnim = false
if (state != states.jump)
    ladderbuffer = 0
if (state != states.jump)
    stompAnim = false
if (toomuchalarm1 > 0)
    toomuchalarm1 -= 1
if (toomuchalarm1 <= 0 && (state == states.mach3 || state == states.hookshot || state == states.mach2 || state == states.charge || (state == states.machslide && mach2 >= 100) || state == states.machroll || state == states.handstandjump || state == states.cottondrill || state == states.cottonroll || state == states.minecart || state == states.minecartspin || (state == states.rocketfistpizzano && sprite_index != spr_pizzano_sjumpprepside) || state == states.pizzanoshoulderbash || (state == states.chainsaw && mach2 >= 100)))
{
    with (instance_create(x, y, obj_mach3effect))
    {
        playerid = other.object_index
        image_index = other.drawimage - 1
        image_xscale = other.xscale * other.scale_xs
        image_yscale = other.yscale * other.scale_ys
        sprite_index = other.drawsprite
    }
    toomuchalarm1 = 6
}
if (toomuchalarm2 > 0)
    toomuchalarm2 -= 1
if (toomuchalarm2 <= 0 && state == states.jump && (sprite_index == spr_playerPZ_scooterspinstart || sprite_index == spr_playerPZ_scooterspin))
{
    with (instance_create(x, y, obj_wallkick_aftereffect))
    {
        playerid = other.object_index
        image_index = other.drawimage - 1
        image_xscale = other.xscale * other.scale_xs
        image_yscale = other.yscale * other.scale_ys
        sprite_index = other.drawsprite
    }
    toomuchalarm2 = 6
}
if (toomuchalarm3 > 0)
    toomuchalarm3 -= 1
if (toomuchalarm3 <= 0 && (state == states.uppercut || state == states.machtumble || (state == states.jump && sprite_index == spr_pizzano_wallclimbspin)))
{
    with (instance_create(x, y, obj_attack_aftereffect))
    {
        playerid = other.object_index
        if (other.drawimage == 0)
            image_index = other.drawimage
        else
            image_index = other.drawimage - 1
        image_xscale = other.xscale * other.scale_xs
        image_yscale = other.yscale * other.scale_ys
        sprite_index = other.drawsprite
    }
    toomuchalarm3 = 6
}
if (mask_index == spr_player_mask || mask_index == spr_crouchmask)
{
    if (state != states.bump && state != states.crouch && state != states.boxxedpep && state != states.pistol && state != states.tumble && sprite_index != spr_player_crouchshoot && state != states.Sjumpprep && state != states.chainsaw && state != states.machroll && state != states.hurt && state != states.cottonroll && state != states.crouchslide && state != states.crouchjump && sprite_index != spr_pizzano_crouchslide && sprite_index != spr_pizzano_mach3slide && sprite_index != spr_pizzano_prepmach3slide)
        mask_index = spr_player_mask
    else
        mask_index = spr_crouchmask
}
if (state == states.gottreasure || sprite_index == spr_knightpep_start || sprite_index == spr_knightpep_thunder || state == states.keyget || state == states.door || state == states.victory || state == states.comingoutdoor || state == states.gameover)
    cutscene = true
else
    cutscene = false
if (state != states.hurt)
    hurtsound = false
if (((place_meeting(x, y, obj_door) && (!(place_meeting(x, y, obj_doorblocked)))) || place_meeting(x, y, obj_cottoncreator) || (place_meeting(x, y, obj_startgate) && state != states.victory && instance_place(x, y, obj_startgate).closed == 0) || place_meeting(x, y, obj_keydoorclock) || place_meeting(x, y, obj_keydoor) || (place_meeting(x, y, obj_exitgate) && global.panic)) && (!instance_exists(obj_uparrow)) && scr_solid(x, (y + 1)) && state == states.normal)
    instance_create(x, y, obj_uparrow)
if ((state == states.mach2 || state == states.mach3) && (!instance_exists(obj_speedlines)))
    instance_create(x, y, obj_speedlines)
if (state != states.backbreaker)
{
    if (supercharge > 9 && state != states.backbreaker)
    {
        supertauntbuffer = 0
        supertauntcharged = true
        scr_tip("staunt")
    }
    if (supertauntcharged && room != rank_room)
    {
        if (!instance_exists(supertaunteffect))
        {
            with (instance_create(x, y, obj_supertaunteffect))
            {
                other.supertaunteffect = id
                playerid = other.id
            }
        }
    }
}
scr_collide_destructibles()
if (state != states.titlescreen && state != states.door && state != states.Sjump && state != states.comingoutdoor && state != states.boulder && state != states.keyget && state != states.victory && state != states.portal && state != states.timesup && state != states.gottreasure && state != states.gameover && state != states.door)
    scr_collide_player()
if (state == states.boulder)
    scr_collide_player()
if (state != states.bushdisguise)
    bushdetection = false
if (state != states.crouch)
    crouchjumptimer = 0
if (gumbobpropellercooldown > 0)
    gumbobpropellercooldown--
if global.starrmode
{
    if (global.starrmode && state == states.mach3)
        movespeed = 12
    else if (state == states.mach3 && movespeed > 12)
        movespeed = 12
}
if (state == states.door || place_meeting(x, y, obj_hallway) || state == states.victory)
    global.roomsave = false
if (state == states.finishingblow && (!floor(image_index)) == (image_number - 1))
{
    with (instance_place(x, y, obj_baddie))
        vsp = 0
    grav = 0
}
if (state == states.finishingblow && floor(image_index) == (image_number - 0))
{
    with (instance_place(x, y, obj_baddie))
        vsp = 0.1
    grav = 0.5
}
if place_meeting(x, y, obj_molasseswater)
    grav = 0.1
else if (!(place_meeting(x, y, obj_molasseswater)))
    grav = 0.5
if place_meeting(x, (y + 1), obj_molassesGround)
{
    if (hsp != 0 && (floor(image_index) % 4) == 0 && grounded)
    {
        with (instance_create(x, (y + 43), obj_debris))
        {
            sprite_index = spr_molassesgoop
            image_index = irandom_range(0, 5)
        }
    }
    if (state == states.climbwall && vsp < 0)
        state = states.normal
    if (vsp < 0 && grounded)
    {
        vsp /= 2
        with (instance_create(x, (y + 43), obj_debris))
        {
            sprite_index = spr_molassesgoop
            image_index = irandom_range(0, 5)
        }
    }
}
if (Dashpad_buffer > 0)
    Dashpad_buffer = max((Dashpad_buffer - 1), 0)
if (sprite_index == spr_player_machpunch1 && floor(image_index) == (image_number - 1))
    sprite_index = spr_mach
if (sprite_index == spr_player_machpunch2 && floor(image_index) == (image_number - 1))
    sprite_index = spr_mach
if (character == "P")
{
    if (sprite_index == spr_mach2jump || sprite_index == spr_playerPZ_scooterspin)
    {
        if (!audio_is_playing(sfx_flip))
            scr_sound(sfx_flip)
    }
}
else if (sprite_index == spr_pizzano_spincancel || sprite_index == spr_pizzano_wallclimbspin)
{
    if (!audio_is_playing(sfx_flip))
        scr_sound(sfx_flip)
}
var _cTitle = floor(global.combo / 5)
if (oldComboTitle != _cTitle && _cTitle != 0)
{
    oldComboTitle = _cTitle
    instance_destroy(combo_title)
    combo_title = noone
    combo_title = instance_create(830, 250, obj_combotitle)
    combo_title.title = _cTitle
    combo_title.image_index = _cTitle
    scr_sound(choose(sfx_combo1, sfx_combo2, sfx_combo3))
}
if (character == "P")
{
    if (audio_is_playing(sfx_flip) && sprite_index != spr_mach2jump && sprite_index != spr_playerPZ_scooterspin)
        audio_stop_sound(sfx_flip)
}
else if (audio_is_playing(sfx_flip) && sprite_index != spr_pizzano_spincancel && sprite_index != spr_pizzano_wallclimbspin)
    audio_stop_sound(sfx_flip)
if instance_exists(obj_rudejanitor_waiting)
{
    if (place_meeting(x, y, obj_secretwall) && obj_rudejanitor_waiting.visible == false)
        obj_rudejanitor_waiting.visible = true
}
if (room == timesuproom)
{
    if (state != states.timesup && state != states.gameover)
    {
        state = states.timesup
        sprite_index = spr_Timesup
    }
}
if instance_exists(obj_secretfound)
    global.secretroom = 1
else if (!instance_exists(obj_secretfound))
{
    if (global.secretroom == 1)
        global.secretroom = 0
}
if (global.panicking == 1)
{
    if (global.secretroom == 1)
    {
        if global.panic
        {
            global.panic = 0
            global.minutessaved = global.minutes
            global.secondssaved = global.seconds
            global.wavesaved = global.wave
            global.maxwavesaved = global.maxwave
        }
        if audio_is_playing(mu_escape)
            audio_pause_sound(mu_escape)
        else if audio_is_playing(mu_laplap)
            audio_pause_sound(mu_laplap)
        else if audio_is_playing(mu_pizzano_escape)
            audio_pause_sound(mu_pizzano_escape)
        else if audio_is_playing(mu_lap2Pizzano)
            audio_pause_sound(mu_lap2Pizzano)
        else if audio_is_playing(mu_lap3)
            audio_pause_sound(mu_lap3)
        var roomname = room
        with (obj_music)
        {
            if ((room == entrywaysecret_1 || room == entrywaysecret_2 || room == entrywaysecret_3) && obj_player.character == "P")
            {
                if (!audio_is_playing(mu_wafflesecret))
                    scr_music(mu_wafflesecret)
            }
            if ((room == entrywaysecret_1 || room == entrywaysecret_2 || room == entrywaysecret_3) && obj_player.character == "N")
            {
                if (!audio_is_playing(mu_pizzano_secret))
                    scr_music(mu_pizzano_secret)
            }
            if (room == steamy_secret1 || room == steamy_secret2 || room == steamy_secret3)
            {
                if (!audio_is_playing(mu_steamysecret))
                    scr_music(mu_steamysecret)
            }
            if (room == molassessecret_1 || room == molassessecret_2 || room == molassessecret_3)
            {
                if (!audio_is_playing(mu_swampsecret))
                    scr_music(mu_swampsecret)
            }
            if (room == minessecret_1 || room == minessecret_2 || room == minessecret_3)
            {
                if (!audio_is_playing(mu_minessecret))
                    scr_music(mu_minessecret)
            }
        }
    }
    else if (instance_exists(obj_secretportalstart) && global.secretroom == 0)
    {
        global.panic = 1
        global.minutes = global.minutessaved
        global.seconds = global.secondssaved
        global.wave = global.wavesaved
        global.maxwave = global.maxwavesaved
        audio_stop_all_music()
        if audio_is_paused(mu_escape)
            audio_resume_sound(mu_escape)
        else if audio_is_paused(mu_laplap)
            audio_resume_sound(mu_laplap)
        else if audio_is_paused(mu_pizzano_escape)
            audio_resume_sound(mu_pizzano_escape)
        else if audio_is_paused(mu_lap2Pizzano)
            audio_resume_sound(mu_lap2Pizzano)
        else if audio_is_paused(mu_lap3)
            audio_resume_sound(mu_lap3)
        scr_escapebgs()
    }
}
if (state != states.normal)
    obj_tv.screensaverbuffer = 600
if (state != states.freefall && state != states.superslam && state != states.freefallland && state != states.actor && smashbodyslam != 0)
    smashbodyslam = 0
if (state != states.drown)
    drownbuffer = 0
if (key_shoot && character == "N" && state != states.fling && state != states.cotton && state != states.cottondrill && state != states.cottonroll && state != states.keyget && sprite_index != spr_pizzano_candybegin && sprite_index != spr_pizzano_candyidle && sprite_index != spr_pizzano_candytransitionup && sprite_index != spr_pizzano_candyup && room != rm_credits && room != realtitlescreen && room != rm_verify && room != rank_room && room != palroom && room != scootercutsceneidk && room != spireintro && sprite_index != spr_pizzano_sleep && sprite_index != spr_pizzano_sleepend && sprite_index != spr_pizzano_taunt && sprite_index != spr_pizzano_supertaunt1 && sprite_index != spr_pizzano_bodyslamprep && sprite_index != spr_pizzano_bodyslamfall && sprite_index != spr_pizzano_superjumpland && sprite_index != spr_pizzano_mach3hitwallair && sprite_index != spr_pizzano_minecartspin && sprite_index != spr_pizzano_minecartjump && sprite_index != spr_pizzano_djump && sprite_index != spr_pizzano_eatdonut && sprite_index != spr_pizzano_sleepstart && sprite_index != spr_pizzano_fireass && sprite_index != spr_pizzano_fireassend && state != states.uppercut && state != states.pizzano && state != states.door && state != states.ladder && state != states.drown && (!instance_exists(obj_titlecard)) && (!instance_exists(obj_layoutselect)))
{
    if (!audio_is_playing(sfx_pizzanoscreamstart))
    {
        if (screambuffer > 0)
            scr_sound(sfx_pizzanoscreamstart)
    }
    if (screambuffer > 0)
        screambuffer--
    else if (!audio_is_playing(sfx_pizzanoscream))
    {
        scr_sound(sfx_pizzanoscream)
        audio_stop_sound(sfx_pizzanoscreamstart)
    }
}
else
{
    if audio_is_playing(sfx_pizzanoscreamstart)
        audio_stop_sound(sfx_pizzanoscreamstart)
    if audio_is_playing(sfx_pizzanoscream)
        audio_stop_sound(sfx_pizzanoscream)
    screambuffer = 30
}
if (global.key_inv && global.lvldesign == 1 && (!instance_exists(obj_spookey)))
{
    with (instance_create(x, (y - 30), obj_explosioneffect))
    {
        sprite_index = spr_taunteffect
        depth = -2
    }
    with (instance_create(x, y, obj_spookey))
        sprite_index = spr_spookey_appear
    scr_queue_tvanim(obj_tv.spookeytvspr, 200)
}
if (!global.realsigma)
{
    drawsprite = sprite_index
    drawimage = image_index
}
else if (spr_sigma == -4)
{
    drawsprite = spr_noclip
    drawimage = image_index
}
else if (state == states.titlescreen)
{
    drawsprite = spr_null
    drawimage = image_index
}
else
{
    drawsprite = spr_sigma
    drawimage += image_speed
    if (floor(drawimage) == (sprite_get_number(drawsprite) - 1))
        drawimage = frac(drawimage)
}
switch global.secretfound
{
    case 1:
        global.secretfound1 = true
        break
    case 2:
        global.secretfound1 = true
        global.secretfound2 = true
        break
    case 3:
        global.secretfound1 = true
        global.secretfound2 = true
        global.secretfound3 = true
        break
    default:
        global.secretfound1 = false
        global.secretfound2 = false
        global.secretfound3 = false
        break
}

if (scale_xs < 1 && tonormalxscale)
{
    scale_ys = approach(scale_ys, 1, 0.2)
    scale_xs = approach(scale_xs, 1, 0.2)
}
else if tonormalxscale
    tonormalxscale = false
if (!global.realsigma)
{
    ischaracter = 0
    spr_sigma = -4
    if (mask_index != spr_player_mask && mask_index != spr_crouchmask)
        mask_index = spr_player_mask
}
if key_jump
    input_buffer_jump = 0
if key_slap2
    input_buffer_slap = 0
if (state != states.crouchslide && state != states.machroll && tauntstoredstate != states.crouchslide && tauntstoredstate != states.machroll)
    input_buffer_crouch = 0
if ((state != states.climbwall && tauntstoredstate != states.climbwall) || character != "N")
    wallbuffer = 0
