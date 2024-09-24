if other.hurtself
{
    cottoned = true
    alarm[2] = 1
    instance_create(x, y, obj_bangeffect)
    scr_sound(sound_slaphit)
    hp = 0
    thrown = true
    hsp = other.image_xscale * 20
    vsp = -6
    state = states.cheeseball
    stunned = 500
}
