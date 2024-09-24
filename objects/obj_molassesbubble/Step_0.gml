y -= 4
if (scr_solid(x, y) || (!(place_meeting(x, y, obj_molasseswater))))
    instance_destroy()
