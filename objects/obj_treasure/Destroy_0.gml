if got
{
    global.collect += 3000
    global.combotime = 60
    global.combofreeze = 10
    create_small_number((x + 16), y, "3000")
}
instance_destroy(effectid)
instance_destroy(obj_treasureeffect)
