condition = function()
{
    return (place_meeting(x, y, obj_player) && obj_player.state == states.freefallland);//72);
}
output = function()
{
    inst_104704.alarm[1] = 5;	// obj_collectablebox (with the marshmellow)
    inst_104694.alarm[1] = 10;	// obj_collectablebox (with the big pie)
    inst_104698.alarm[1] = 1;	// obj_collectablebox (with the 2 small candies)
}
