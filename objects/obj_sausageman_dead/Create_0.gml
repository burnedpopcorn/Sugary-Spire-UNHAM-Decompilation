vsp = random_range(-12, -17);
hsp = sign(obj_player.hsp) + (12 * obj_player.xscale);
grav = 0.4;
alarm[0] = 5;
cigar = false;
stomped = false;

if (x != obj_player.x)
    image_xscale = -sign(x - obj_player.x);

deadrot = choose(4, 5, 8, 10, -4, -5, -8, -10);
cloudbuffer = 0;
