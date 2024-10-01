if (instance_exists(baddieID) && instance_exists(other.baddieID) && baddieID.thrown != 1 && other.baddieID.thrown && baddieID.state != baddiestates.grabbed)//states.boxxedpep)
{
    scr_sound(sound_punch)
    instance_destroy(baddieID)
    repeat (3)
    {
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
    }
    global.hit += 1
    global.combotime = 60
}
