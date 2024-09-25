function scr_player_cotton()
{
    var modify;
    
    static cotton_afterimagetimer = 6;
    
    if (sprite_index == spr_cottontransfo)
    {
        hsp = 0;
        
        if (animation_end())
        {
            xscale *= -1;
            sprite_index = spr_cottonland;
            
            with (obj_cottoncreator)
                visible = true;
            
            scr_tip("cotton");
            image_speed = 0.35;
        }
    }
    
    if (sprite_index != spr_cottontransfo)
    {
        if (sprite_index != spr_cottonPizzano_wallclimb)
        {
            if (sprite_index != spr_cottonPizzano_jumpwall && sprite_index != spr_cottonPizzano_fall && sprite_index != spr_cottonPizzano_fastfall && sprite_index != spr_cottonPizzano_drillup)
            {
                if (dir != xscale)
                {
                    dir = xscale;
                    movespeed = 0;
                }
            }
            
            if (sprite_index != spr_cotton_slam && sprite_index != spr_cotton_slam2 && sprite_index != spr_cotton_slam3 && sprite_index != spr_cottonPizzano_wallclimb)
                move = key_left + key_right;
            
            if (sprite_index != spr_cottonattack)
            {
                if (move != 0)
                    xscale = move;
            }
            
            hsp = move * movespeed;
            
            if (move != 0)
            {
                if (movespeed < 8)
                    movespeed += 0.5;
            }
            else
            {
                movespeed = 0;
            }
            
            if (vsp > 5)
                vsp = 5;
            
            if (input_buffer_jump < 8 && grounded)
            {
                vsp = -14;
                grav = 0.025;
                image_index = 0;
                sprite_index = spr_cottonpljump;
                instance_create(x, y, obj_highjumpcloud2);
                scr_sound(sfx_cottonjump);
                input_buffer_jump = 8;
            }
            
            if (input_buffer_slap < 8 && sprite_index != spr_cottonattack && groundedcot)
            {
                flash = true;
                image_index = 0;
                sprite_index = spr_cottonattack;
                
                if (!grounded)
                    vsp = -5;
                
                grav = 0.2;
                scr_sound(sfx_cottonattack);
                groundedcot = false;
                input_buffer_slap = 8;
            }
            
            if (sprite_index == spr_cottonattack)
            {
                hsp = 10 * xscale;
                instance_create(x, y, obj_swordhitbox);
                move = xscale;
                
                if ((-key_left2 && xscale == 1) || (key_right2 && xscale == -1))
                {
                    movespeed = 0;
                    vsp = 0;
                    hsp = 0;
                    sprite_index = spr_cottonfall;
                }
            }
            
            if (sprite_index == spr_cottonattack && animation_end())
            {
                if (grounded)
                {
                    image_index = 0;
                    sprite_index = spr_cottonidle;
                }
                else
                {
                    image_index = 0;
                    sprite_index = spr_cottonfall;
                }
            }
            
            if (sprite_index == spr_cottonidle && move != 0)
            {
                image_index = 0;
                sprite_index = spr_cottonwalk;
            }
            
            if (sprite_index == spr_cottonwalk && move == 0)
            {
                image_index = 0;
                sprite_index = spr_cottonidle;
            }
            
            if ((sprite_index == spr_cottonpljump || sprite_index == spr_cottonPizzano_drillup || sprite_index == spr_cottonPizzano_jumpwall) && animation_end())
            {
                image_index = 0;
                
                if (sprite_index == spr_cottonPizzano_drillup)
                {
                    if (key_slap)
                    {
                        state = states.cotton;
                        flash = true;
                        image_index = 0;
                        sprite_index = spr_cottonattack;
                        grounded = false;
                        vsp = -5;
                        grav = 0.2;
                        scr_sound(sound_suplex1);
                        groundedcot = false;
                    }
                    else
                    {
                        sprite_index = spr_cottonfall;
                    }
                }
                else
                {
                    sprite_index = spr_cottonfall;
                }
            }
            
            if (sprite_index == spr_cottonPizzano_fastfall && !key_down)
                sprite_index = spr_cottonfall;
            
            if (sprite_index == spr_cottondoublejump && animation_end())
            {
                image_index = 0;
                sprite_index = spr_cottondoublefall;
            }
            
            if ((sprite_index == spr_cottonfall || sprite_index == spr_cottondoublefall || sprite_index == spr_cottonpljump || sprite_index == spr_cottondoublejump || sprite_index == spr_cottonPizzano_fastfall) && grounded && vsp >= 0)
            {
                image_index = 0;
                
                if (move != 0)
                    sprite_index = spr_cottonland2;
                else
                    sprite_index = spr_cottonland;
                
                instance_create(x, y, obj_landcloud);
                scr_sound(sound_land);
            }
            
            if ((sprite_index == spr_cottonfall && input_buffer_jump < 8) && character == "P")
            {
                vsp = -10;
                grav = 0.1;
                image_index = 0;
                sprite_index = spr_cottondoublejump;
                
                with (instance_create(x, y, obj_highjumpcloud2))
                {
                    image_xscale = other.xscale;
                    
                    if (other.character == "N")
                        sprite_index = spr_pizzano_cottonpoof;
                    else
                        sprite_index = spr_cottonpoof;
                }
                
                scr_sound(sfx_cottondoublejump);
                input_buffer_jump = 8;
            }
            
            if (input_buffer_jump < 8 && sprite_index == spr_cottonfall && sprite_index != spr_cottonPizzano_drillup && !grounded && character == "N")
            {
                vsp = -14;
                grav = 0.1;
                image_index = 0;
                sprite_index = spr_cottonPizzano_drillup;
                
                with (instance_create(x, y, obj_highjumpcloud2))
                {
                    image_xscale = other.xscale;
                    
                    if (other.character == "N")
                        sprite_index = spr_pizzano_cottonpoof;
                    else
                        sprite_index = spr_cottonpoof;
                }
                
                scr_sound(sfx_cottondoublejump);
                input_buffer_jump = 8;
            }
            
            if (sprite_index == spr_cottonland && animation_end())
                sprite_index = spr_cottonidle;
            
            if (sprite_index == spr_cottonland2 && animation_end())
                sprite_index = spr_cottonwalk;
            
            if (key_down && grounded)
            {
                sprite_index = spr_cottonroll;
                state = states.cottonroll;
                
                if (movespeed < 8)
                    movespeed = 8;
                
                if (move != 0)
                    xscale = move;
            }
            
            if (key_down2 && !grounded && drill && sprite_index != spr_cotton_slam && sprite_index != spr_cotton_slam2 && sprite_index != spr_cotton_slam3 && sprite_index != spr_cottonPizzano_wallclimb && character == "P")
            {
                vsp = 9;
                state = states.cottondrill;
                sprite_index = spr_cottondrill;
                image_index = 0;
                scr_sound(sound_suplex1);
                flash = true;
                drill = false;
                
                with (instance_create(x, y, obj_afterimageoutward))
                    hspeed = 7;
                
                with (instance_create(x, y, obj_afterimageoutward))
                    hspeed = -7;
                
                with (instance_create(x, y, obj_afterimageoutward))
                    vspeed = 7;
                
                with (instance_create(x, y, obj_afterimageoutward))
                    vspeed = -7;
            }
            
            if (key_down && !grounded && sprite_index != spr_cotton_slam && sprite_index != spr_cotton_slam2 && sprite_index != spr_cotton_slam3 && sprite_index != spr_cottonPizzano_wallclimb && character == "N")
            {
                vsp = 11;
                sprite_index = spr_cottonPizzano_fastfall;
            }
            
            if ((scr_solid(x + xscale, y) && !place_meeting(x, y + 1, obj_slope) && !place_meeting(x, y + 1, obj_slopeplatform) && !place_meeting(x + sign(movespeed), y, obj_destructibles) && !place_meeting(x + sign(movespeed), y, obj_bigdestructibles) && !place_meeting(x + sign(movespeed), y, obj_oneway)) && !grounded && sprite_index != spr_cottonattack && sprite_index != spr_cottondrill && sprite_index != spr_cottonPizzano_drillup && sprite_index != spr_cottonPizzano_fastfall && character == "N")
            {
                image_index = 0;
                sprite_index = spr_cottonPizzano_wallclimb;
                vsp = -movespeed;
                
                if (move != 0)
                    xscale = move;
            }
            
            if (!grounded && sprite_index != spr_cottonpljump && sprite_index != spr_cottonattack && sprite_index != spr_cottondoublejump && sprite_index != spr_cottondoublefall && sprite_index != spr_cottondrill && sprite_index != spr_cotton_slam && sprite_index != spr_cotton_slam2 && sprite_index != spr_cotton_slam3 && sprite_index != spr_cottonPizzano_drillup && sprite_index != spr_cottonPizzano_wallclimb && sprite_index != spr_cottonPizzano_jumpwall && sprite_index != spr_cottonPizzano_fastfall)
                sprite_index = spr_cottonfall;
            
            if (grounded && !drill)
                drill = true;
        }
        else if (sprite_index == spr_cottonPizzano_wallclimb && character == "N")
        {
            vsp = approach(vsp, (key_down - key_up) * 10, 1);
            
            if (!scr_solid(x + (xscale * 16), y) && sprite_index != spr_cottonpljump)
                sprite_index = spr_cottonfall;
            
            if (input_buffer_jump < 8)
            {
                vsp = -14;
                xscale *= -1;
                modify = 1;
                
                if (xscale == -1)
                    modify = -1;
                
                movespeed = 11 * modify * xscale;
                grav = 0.1;
                image_index = 0;
                sprite_index = spr_cottonPizzano_jumpwall;
                
                with (instance_create(x, y, obj_highjumpcloud2))
                {
                    image_xscale = other.xscale;
                    
                    if (other.character == "N")
                        sprite_index = spr_pizzano_cottonpoof;
                    else
                        sprite_index = spr_cottonpoof;
                }
                
                scr_sound(sfx_cottondoublejump);
                input_buffer_jump = 8;
            }
            
            if (key_down && grounded)
            {
                image_index = 0;
                sprite_index = spr_cottonland;
                
                if (move != 0)
                    sprite_index = spr_cottonland2;
                
                movespeed = 0;
                
                if (place_meeting(x, y + 1, obj_slope) || place_meeting(x, y + 1, obj_slopeplatform))
                {
                    sprite_index = spr_cottonroll;
                    state = states.cottonroll;
                    movespeed = 8;
                    
                    if (move != 0)
                        xscale = move;
                }
            }
        }
        
        if (sprite_index == spr_cottonwalk)
        {
            image_speed = ((movespeed / 8) * 0.15) + 0.35;
        }
        else if (sprite_index == spr_cottonPizzano_wallclimb)
        {
            image_speed = (-vsp / 8) * 0.5;
            
            if (grounded && vsp > 0)
                image_speed = 0;
        }
        else
        {
            image_speed = 0.35;
        }
        
        if (cotton_afterimagetimer > 0)
            cotton_afterimagetimer--;
        
        if (cotton_afterimagetimer <= 0)
        {
            with (instance_create(x, y, obj_cotton_aftereffect))
                playerid = other.id;
            
            cotton_afterimagetimer = 6;
        }
    }
}