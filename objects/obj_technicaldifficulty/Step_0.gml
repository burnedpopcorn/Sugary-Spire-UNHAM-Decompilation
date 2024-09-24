static_index += (0.35 * static_dir)
if use_static
{
    if (static_dir > 0 && floor(static_index) == (sprite_get_number(spr_tvstatic1204) - 1))
        use_static = false
    else if (static_dir < 0 && static_index <= 0)
        instance_destroy()
}
