enum baddiestates
{
	idle,
	charge,
	turn,
	walk,
	land,
	hit,
	stun,
	thrown,
	grabbed,
	scared,
	panic,
	inhaled,
	cherrywait,
	charcherry,
	applejimbash,
	kick,
	slugidle,
	slugjump,
	slugparry
};
ScareBuffer = 0
depth = 0
squashed = false
squashval = 0
stuntouch = 0
escapePortal = -4
deadspr = spr_gumball_dead
important = false
alarm[1] = 5
cottoned = false
shakebuffer = 0
angryindex = 0
flyup = 0
shake = 2
hitLag = 25
if (global.hitstun == 1)
    hitLag = 0
hitX = x
hitY = y
hitvsp = 0
hithsp = 0
