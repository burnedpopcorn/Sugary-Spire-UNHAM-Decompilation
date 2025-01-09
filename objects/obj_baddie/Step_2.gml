stuntouch--;
stuntouch = max(0, stuntouch);

if (squashed)
{
    squashval = approach(squashval, 0.4, 0.15);
    
    if (squashval >= 0.4)
        squashed = false;
}
else if (squashed == 0)
{
    squashval = approach(squashval, 0, 0.05);
}

if (state != baddiestates.grabbed && state != baddiestates.panic)
    scr_collide();

if (state == baddiestates.grabbed)
{
    vsp = 0;
    hsp = 0;
}

if (obj_player.state == states.backbreaker && !thrown && point_in_camera(x, y, view_camera[0]) && obj_player.sprite_index == obj_player.spr_player_taunt)
{
    stunned = 0;
    ScareBuffer = 0;
    var targetplayer = instance_nearest(x, y, obj_player);
    
    if (x != targetplayer.x && grounded && (object_index == obj_charger || object_index == obj_swedishfish))
    {
        if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400))
        {
            if (state == baddiestates.walk)
            {
                state = baddiestates.charge;
                movespeed = 0;
                image_xscale = -sign(x - obj_player.x);
                sprite_index = spr_banana_chargestart;
                
                if (object_index == obj_swedishfish)
                    sprite_index = spr_swed_chargestart;
                
                image_index = 0;
            }
        }
    }
    
    if (x != targetplayer.x && grounded && object_index == obj_sluggy && state == baddiestates.walk)
    {
        if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400))
        {
            state = baddiestates.slugjump;
            image_xscale = -sign(x - obj_player.x);
            jumptimer = 100;
            sprite_index = spr_sluggy_jumpstart;
            image_index = 0;
            movespeed = 0;
            hsp = 0;
            vsp = 0;
        }
    }
    
    if (x != targetplayer.x && grounded && object_index == obj_cottonwitch && !global.layout)
    {
        if (state != baddiestates.thrown && !bombreset && (targetplayer.x > (x - 400) && targetplayer.x < (x + 400)))
        {
            if (state == baddiestates.walk || state == baddiestates.idle)
            {
                image_index = 0;
                state = baddiestates.thrown;
                
                if (x != obj_player.x)
                    image_xscale = -sign(x - obj_player.x);
                
                sprite_index = spr_throw;
            }
        }
    }
    
    if (x != targetplayer.x && grounded && object_index == obj_cottonwitch && global.layout)
    {
        if (state != baddiestates.thrown && (targetplayer.x > (x - 300) && targetplayer.x < (x + 300)) && bombreset < 100)
        {
            if (state == baddiestates.walk || state == baddiestates.idle)
            {
                hsp = 0;
                image_index = 0;
                state = baddiestates.witchattack;
                
                if (x != obj_player.x)
                    image_xscale = -sign(x - obj_player.x);
                
                sprite_index = spr_cottonwitch_attack;
                bombreset = 180;
            }
        }
    }
    
    if (state != baddiestates.stun && state != baddiestates.charge && state != baddiestates.slugjump)
        shakebuffer = 10;
}
