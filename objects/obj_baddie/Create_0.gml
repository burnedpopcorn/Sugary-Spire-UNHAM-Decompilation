enum baddiestates
{
	idle,					// 0
	charge,					// 1
	turn,					// 2
	walk,					// 3
	land,					// 4
	hit,					// 5
	stun,					// 6
	thrown,					// 7
	grabbed,				// 8
	scared,					// 9
	panic,					// 11
	inhaled,				// 10
	cherrywait,				// 12
	charcherry,				// 13
	applejimbash,			// 14
	kick,					// 15
	slugidle,				// 16
	slugjump,				// 17
	slugparry,				// 18
	// new one appearently
	prepdead				// 19
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
