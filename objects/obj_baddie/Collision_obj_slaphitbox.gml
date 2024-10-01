if (object_index != obj_charcherry && (!thrown) && state != baddiestates.prepdead)//states.meteorpep)
{
    scr_sound(sound_slaphit)
    instance_create((x + obj_player.xscale * 40), y, obj_punchdust)
    if (obj_player.character == "P")
    {
        if (!global.cane)
        {
            state = baddiestates.grabbed;
            with (obj_player)
            {
                suplexhavetomash = 5
                baddiegrabbedID = other.id
                if (movespeed <= 12)
                {
                    state = states.grab
                    sprite_index = spr_player_haulingstart
                }
                else
                {
                    sprite_index = spr_player_swingding
                    state = states.charge
                    instance_create(x, y, obj_jumpdust)
                }
                if key_up
                {
                    state = states.superslam
                    sprite_index = spr_player_piledriverstart
                    vsp = -12
                }
                image_index = 0
            }
            instance_destroy(other.id)
        }
        else
        {
			state = baddiestates.stun;
            hp -= 1
            thrown = true
            hsp = obj_player.xscale * 15
            vsp = -6
            obj_player.hsp = 0
            obj_player.vsp = 0
            obj_player.sprite_index = obj_player.spr_canehit
            obj_player.state = states.finishingblow
        }
    }
}
