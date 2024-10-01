function scr_player_superslam()
{
    if (vsp > 0)
        vsp += 0.5;
    
    if (vsp > 0)
        smashbodyslam++;
    
    if (vsp < 0)
        smashbodyslam = -8;
    
    if (dir != xscale)
    {
        dir = xscale;
        movespeed = 0;
    }
    
    move = key_left + key_right;
    
    if (move != 0)
        xscale = move;
    
    hsp = move * movespeed;
    
    if (move != 0)
        movespeed = 5;
    else
        movespeed = 0;
    
    mach2 = 0;
    
    if (sprite_index == spr_player_piledriverstart && animation_end())
    {
        sprite_index = spr_piledriver;
        image_index = 0;
    }
    
    if (sprite_index == spr_player_piledriverstart || sprite_index == spr_piledriver)
    {
        move = key_left + key_right;
        hsp = move * movespeed;
    }
    else
    {
        move = 0;
        hsp = 0;
    }
    
    if ((sprite_index == spr_piledriver || sprite_index == spr_player_piledriverstart) && (grounded && !place_meeting(x, y + 1, obj_destructibles) && (smashbodyslam > 10 || place_meeting(x, y + vsp, obj_metalblock)) && vsp > 0))
    {
        sprite_index = spr_piledriverland;
        scr_sound(sound_maximumspeedland);
        jumpAnim = true;
        jumpstop = false;
        image_index = 0;
        
        with (obj_camera)
        {
            shake_mag = 20;
            shake_mag_acc = 40 / room_speed;
        }
        
        hsp = 0;
        bounce = false;
        
        with (instance_create(x, y + 35, obj_bangeffect))
            xscale = obj_player.xscale;
        
        instance_create(x, y, obj_landcloud);
        freefallstart = 0;
        
        with (obj_camera)
        {
            shake_mag = 5;
            shake_mag_acc = 15 / room_speed;
        }
        
        if (smashbodyslam >= 20)
        {
            with (obj_baddie)
            {
                if (point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
                {
                    state = baddiestates.stun;
                    
                    if (stunned < 100)
                        stunned = 100;
                    
                    vsp = -10;
                    image_xscale *= -1;
                    hsp = 0;
                }
            }
            
            with (obj_camera)
            {
                shake_mag = 10;
                shake_mag_acc = 30 / room_speed;
            }
        }
        
        if (instance_exists(baddiegrabbedID))
        {
            with (obj_camera)
            {
                shake_mag = 3;
                shake_mag_acc = 3 / room_speed;
            }
            
            with (baddiegrabbedID)
            {
                scr_sound(sound_killingblow);
                instance_create(x, y, obj_slapstar);
                instance_create(x, y, obj_baddiegibs);
                flash = true;
                global.combotime = 60;
                global.hit += 1;
                alarm[1] = 5;
                thrown = true;
                x = obj_player.x;
                y = obj_player.y;
                hsp = other.xscale * 10;
                vsp = -10;
                hp = 0;
                thrown = true;
                state = baddiestates.stun;
                stunned = 9999;
            }
        }
    }
    
    jumpAnim = true;
    dashAnim = true;
    landAnim = false;
    machslideAnim = true;
    moveAnim = true;
    stopAnim = true;
    crouchslideAnim = true;
    crouchAnim = true;
    
    if (sprite_index == spr_piledriverland && floor(image_index) == (image_number - 1))
    {
        vsp = -11;
        grav = 0.3;
        state = states.jump;
        
        if (character == "P")
            sprite_index = spr_player_piledriveafter;
        
        if (character == "DEEZNUTS")
            sprite_index = spr_playerN_jump;
        
        image_speed = 0.35;
    }
    
    if (move != 0)
    {
        if (movespeed < 6)
            movespeed += 0.25;
        else if (floor(movespeed) == 5)
            movespeed = 6;
    }
    else
    {
        movespeed = 0;
    }
    
    if (movespeed > 6)
        movespeed -= 0.1;
    
    if (character == "DEEZNUTS" && move != 0)
        xscale = move;
    
    if (smashbodyslam > 10 && !instance_exists(obj_groundpoundeffect))
        instance_create_depth(x, y, -6, obj_groundpoundeffect);
    
    image_speed = 0.35;
}
/*
function scr_player_superslam() //scr_player_superslam
{
    if (vsp > 0)
        vsp += 0.5
    if (vsp > 0)
        smashbodyslam++
    if (vsp < 0)
        smashbodyslam = -8
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 0
    }
    move = key_left + key_right
    if (move != 0)
        xscale = move
    hsp = move * movespeed
    if (move != 0)
        movespeed = 5
    else
        movespeed = 0
    mach2 = 0
    if (sprite_index == spr_player_piledriverstart && animation_end())
    {
        sprite_index = spr_piledriver
        image_index = 0
    }
    if (sprite_index == spr_player_piledriverstart || sprite_index == spr_piledriver)
    {
        move = key_left + key_right
        hsp = move * movespeed
    }
    else
    {
        move = 0
        hsp = 0
    }
    if ((sprite_index == spr_piledriver || sprite_index == spr_player_piledriverstart) && grounded && (!(place_meeting(x, (y + 1), obj_destructibles))) && (smashbodyslam > 10 || place_meeting(x, (y + vsp), obj_metalblock)) && vsp > 0)
    {
        sprite_index = spr_piledriverland
        scr_sound(sound_maximumspeedland)
        jumpAnim = true
        jumpstop = false
        image_index = 0
        with (obj_camera)
        {
            shake_mag = 20
            shake_mag_acc = 40 / room_speed
        }
        hsp = 0
        bounce = false
        with (instance_create(x, (y + 35), obj_bangeffect))
            xscale = obj_player.xscale
        instance_create(x, y, obj_landcloud)
        freefallstart = 0
        with (obj_camera)
        {
            shake_mag = 5
            shake_mag_acc = 15 / room_speed
        }
        if (smashbodyslam >= 20)
        {
            with (obj_baddie)
            {
                if (point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
                {
                    state = states.cheeseball
                    if (stunned < 100)
                        stunned = 100
                    vsp = -10
                    image_xscale *= -1
                    hsp = 0
                }
            }
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = 30 / room_speed
            }
        }
        if instance_exists(baddiegrabbedID)
        {
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = 3 / room_speed
            }
            with (baddiegrabbedID)
            {
                scr_sound(sound_killingblow)
                instance_create(x, y, obj_slapstar)
                instance_create(x, y, obj_baddiegibs)
                flash = true
                global.combotime = 60
                global.hit += 1
                alarm[1] = 5
                thrown = true
                x = obj_player.x
                y = obj_player.y
                hsp = other.xscale * 10
                vsp = -10
                hp = 0
                thrown = true
                state = baddiestates.stun;
                stunned = 9999
            }
        }
    }
    jumpAnim = true
    dashAnim = true
    landAnim = false
    machslideAnim = true
    moveAnim = true
    stopAnim = true
    crouchslideAnim = true
    crouchAnim = true
    if (sprite_index == spr_piledriverland && floor(image_index) == (image_number - 1))
    {
        vsp = -11
        grav = 0.3
        state = states.jump
        if (character == "P")
            sprite_index = spr_player_piledriveafter
        if (character == "DEEZNUTS")
            sprite_index = spr_playerN_jump
        image_speed = 0.35
    }
    if (move != 0)
    {
        if (movespeed < 6)
            movespeed += 0.25
        else if (floor(movespeed) == 5)
            movespeed = 6
    }
    else
        movespeed = 0
    if (movespeed > 6)
        movespeed -= 0.1
    if (character == "DEEZNUTS" && move != 0)
        xscale = move
    if (smashbodyslam > 10 && (!instance_exists(obj_groundpoundeffect)))
        instance_create_depth(x, y, -6, obj_groundpoundeffect)
    image_speed = 0.35
}

