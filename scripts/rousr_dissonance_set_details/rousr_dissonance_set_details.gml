function rousr_dissonance_set_details(argument0) //rousr_dissonance_set_details
{
    with (global.__rousr_dissonance)
    {
        Is_dirty = true
        discord_set_details(argument0)
    }
}

