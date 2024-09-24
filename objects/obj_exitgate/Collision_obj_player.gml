if (global.panic && room != hub_start)
{
    with (obj_player)
    {
        if (grounded && key_up && (state == states.normal || state == states.mach1 || state == states.mach2 || state == states.mach3))
        {
            targetDoor = "none"
            if (global.collect >= global.srank)
            {
                if (global.combodropped == 0 && global.secretfound > 2 && global.lapcount > 0 && global.treasure > 0)
                    global.rank = "p"
                else
                    global.rank = "s"
            }
            else if (global.collect > global.arank)
                global.rank = "a"
            else if (global.collect > global.brank)
                global.rank = "b"
            else if (global.collect > global.crank)
                global.rank = "c"
            else
                global.rank = "d"
            if (global.rank == "s")
                scr_sound(mu_ranknew)
            if (global.rank == "a")
                scr_sound(mu_rankanew)
            if (global.rank == "b")
                scr_sound(mu_rankbnew)
            if (global.rank == "c")
                scr_sound(mu_rankbnew)
            if (global.rank == "d")
                scr_sound(mu_rankdnew)
            if (global.rank == "p")
                scr_sound(mu_rankpnew)
            audio_stop_sound(mu_escape)
            audio_stop_sound(mu_laplap)
            audio_stop_sound(mu_pizzano_escape)
            audio_stop_sound(mu_lap2Pizzano)
            audio_stop_sound(mu_lap3)
            ini_open(global.charsave)
            if (rank_checker(global.rank) > rank_checker(ini_read_string("Ranks", string(global.levelname), "none")))
            {
                ini_write_string("Ranks", string(global.levelname), global.rank)
                if (!instance_exists(obj_saveicon))
                    instance_create_depth(0, 0, -1000, obj_saveicon)
                else
                {
                    with (obj_saveicon)
                        finishbuffer = 200
                }
            }
            if (ini_read_string("Secret", string(global.levelname), 0) < global.secretfound)
            {
                ini_write_string("Secret", string(global.levelname), global.secretfound)
                if (!instance_exists(obj_saveicon))
                    instance_create_depth(0, 0, -1000, obj_saveicon)
                else
                {
                    with (obj_saveicon)
                        finishbuffer = 200
                }
            }
            if (ini_read_string("Treasure", string(global.levelname), 0) == 0)
            {
                if (global.treasure == true)
                {
                    if (!instance_exists(obj_saveicon))
                        instance_create_depth(0, 0, -1000, obj_saveicon)
                    else
                    {
                        with (obj_saveicon)
                            finishbuffer = 200
                    }
                }
                ini_write_string("Treasure", string(global.levelname), global.treasure)
            }
            if (ini_read_string("Highscore", string(global.levelname), 0) < global.collect)
            {
                ini_write_string("Highscore", string(global.levelname), global.collect)
                if (!instance_exists(obj_saveicon))
                    instance_create_depth(0, 0, -1000, obj_saveicon)
                else
                {
                    with (obj_saveicon)
                        finishbuffer = 200
                }
            }
            if (ini_read_string("Laps", string(global.levelname), 0) < (global.lapcount + 1))
            {
                ini_write_string("Laps", string(global.levelname), (global.lapcount + 1))
                if (!instance_exists(obj_saveicon))
                    instance_create_depth(0, 0, -1000, obj_saveicon)
                else
                {
                    with (obj_saveicon)
                        finishbuffer = 200
                }
            }
            if (ini_read_string("Confecti", (string(global.levelname) + "1"), 0) == 0)
            {
                if global.mallowfollow
                {
                    if (!instance_exists(obj_saveicon))
                        instance_create_depth(0, 0, -1000, obj_saveicon)
                    else
                    {
                        with (obj_saveicon)
                            finishbuffer = 200
                    }
                }
                ini_write_string("Confecti", (string(global.levelname) + "1"), global.mallowfollow)
            }
            if (ini_read_string("Confecti", (string(global.levelname) + "2"), 0) == 0)
            {
                if global.chocofollow
                {
                    if (!instance_exists(obj_saveicon))
                        instance_create_depth(0, 0, -1000, obj_saveicon)
                    else
                    {
                        with (obj_saveicon)
                            finishbuffer = 200
                    }
                }
                ini_write_string("Confecti", (string(global.levelname) + "2"), global.chocofollow)
            }
            if (ini_read_string("Confecti", (string(global.levelname) + "3"), 0) == 0)
            {
                if global.crackfollow
                {
                    if (!instance_exists(obj_saveicon))
                        instance_create_depth(0, 0, -1000, obj_saveicon)
                    else
                    {
                        with (obj_saveicon)
                            finishbuffer = 200
                    }
                }
                ini_write_string("Confecti", (string(global.levelname) + "3"), global.crackfollow)
            }
            if (ini_read_string("Confecti", (string(global.levelname) + "4"), 0) == 0)
            {
                if global.wormfollow
                {
                    if (!instance_exists(obj_saveicon))
                        instance_create_depth(0, 0, -1000, obj_saveicon)
                    else
                    {
                        with (obj_saveicon)
                            finishbuffer = 200
                    }
                }
                ini_write_string("Confecti", (string(global.levelname) + "4"), global.wormfollow)
            }
            if (ini_read_string("Confecti", (string(global.levelname) + "5"), 0) == 0)
            {
                if global.candyfollow
                {
                    if (!instance_exists(obj_saveicon))
                        instance_create_depth(0, 0, -1000, obj_saveicon)
                    else
                    {
                        with (obj_saveicon)
                            finishbuffer = 200
                    }
                }
                ini_write_string("Confecti", (string(global.levelname) + "5"), global.candyfollow)
            }
            if (ini_read_string("Lap3", string(global.levelname), 0) == 0 && global.lappingsys == 1 && global.lapcount == 2)
            {
                ini_write_string("Lap3", string(global.levelname), 1)
                if global.mallowfollow
                {
                    if (!instance_exists(obj_saveicon))
                        instance_create_depth(0, 0, -1000, obj_saveicon)
                    else
                    {
                        with (obj_saveicon)
                            finishbuffer = 200
                    }
                }
            }
            ini_close()
            function confecti_count_level(argument0)//@gml_Object_obj_exitgate_Collision_obj_player(argument0) //confecti_count_level@gml_Object_obj_exitgate_Collision_obj_player
            {
                var cnt = 0
                ini_open(global.charsave)
                for (var i = 1; i <= 5; i++)
                {
                    var _c = string(argument0) + string(i)
                    if (ini_read_string("Confecti", _c, 0) == 1)
                        cnt++
                }
                ini_close()
                return cnt;
            }

            obj_tv.tvsprite = spr_tvoff
            if (!instance_exists(obj_endlevelfade))
            {
                instance_create(x, y, obj_endlevelfade)
                if (state != states.door)
                {
                    sprite_index = spr_lookdoor
                    state = states.door
                    obj_endlevelfade.alarm[0] = 235
                    image_index = 0
                }
            }
            if (global.combo > global.maxcombo)
                global.maxcombo = global.combo
            global.panic = false
        }
    }
}
