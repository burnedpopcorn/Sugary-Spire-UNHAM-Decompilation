function scr_player_addslopemomentum(argument0, argument1)
{
    with (instance_place(x, y + 1, obj_slope))
    {
        if (sign(image_xscale) == -sign(other.xscale))
        {
            if (abs(image_yscale) < abs(image_xscale))
                other.movespeed += argument0;
            else
                other.movespeed += argument1;
        }
        else if (abs(image_yscale) < abs(image_xscale))
        {
            other.movespeed -= (argument0 / 2);
        }
        else
        {
            other.movespeed -= (argument1 / 2);
        }
    }
    
    with (instance_place(x, y + 1, obj_slopeplatform))
    {
        if (sign(image_xscale) == -sign(other.xscale))
        {
            if (abs(image_yscale) < abs(image_xscale))
                other.movespeed += argument0;
            else
                other.movespeed += argument1;
        }
        else if (abs(image_yscale) < abs(image_xscale))
        {
            other.movespeed -= (argument0 / 1.8);
        }
        else
        {
            other.movespeed -= (argument1 / 1.8);
        }
    }
}
