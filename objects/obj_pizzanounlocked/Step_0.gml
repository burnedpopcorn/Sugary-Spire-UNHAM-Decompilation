if fadein
{
    fade = approach(fade, 1, 0.05)
    if (fade >= 1)
        instance_destroy()
}
else
    fade = approach(fade, 0, 0.1)
