depth = 4;

can_collide = function(argument0 = obj_player)
{
    var wow;
    
    if (argument0 == undefined)
        argument0 = obj_player;
    
    if (argument0 == obj_player)
    {
        wow = argument0.state == states.minecart;
        
        if (argument0.state == states.minecartspin)
            wow = argument0.state == states.minecartspin;
        
        if (argument0.ischaracter == 2 && argument0.state != states.freefall)
            wow = true;
        
        return wow;
    }
    else if (argument0 == obj_minecart || argument0 == obj_train)
    {
        return true;
    }
    else
    {
        return false;
    }
};