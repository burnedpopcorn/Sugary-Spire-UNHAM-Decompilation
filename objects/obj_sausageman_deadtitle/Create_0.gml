vsp = random_range(-5, -10);
hsp = choose(-20, 20);
grav = 0.4;
alarm[0] = 5;
cigar = false;
stomped = false;

if (x != obj_player.x)
    image_xscale = -sign(x - obj_player.x);

deadrot = 0;
destroybuffer = 50;
paletteselect = 1;
