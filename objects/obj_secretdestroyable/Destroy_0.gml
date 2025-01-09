scr_cutoff(false);

if (ds_list_find_index(global.saveroom, id) == -1)
{
    var rep = 4 + ((sprite_width / 32) - 1) + ((sprite_height / 32) - 1);
    
    if (particlespr != -4)
        rep = 2 + ((sprite_width / 32) - 1) + ((sprite_height / 32) - 1);
    
    repeat (rep)
    {
        if (particlespr == -4)
        {
            instance_create(x + random_range(0, sprite_width), y + random_range(0, sprite_height), obj_debris);
        }
        else
        {
            with (instance_create(x + random_range(0, sprite_width), y + random_range(0, sprite_height), obj_debris))
            {
                sprite_index = other.particlespr;
                image_speed = 0;
                image_index = irandom_range(0, image_number - 1);
            }
        }
    }
    
    if (audio_is_playing(sound_destroyblock1) || audio_is_playing(sound_destroyblock2))
    {
        audio_stop_sound(sound_destroyblock1);
        audio_stop_sound(sound_destroyblock2);
    }
    
    scr_sound(choose(sound_destroyblock1, sound_destroyblock2));
    ds_list_add(global.saveroom, id);
    
    if (global.lappingsys == 1 && global.lapcount == 2)
        ds_list_add(global.escaperoom, id);
}

for (var j = 0; j < array_length(tiletarget); j++)
{
    var map_id = layer_tilemap_get_id(tiletarget[j]);
    
    for (var i = 0; i < floor(sprite_width / tilemap_get_tile_width(map_id)); i++)
    {
        for (var z = 0; z < floor(sprite_height / tilemap_get_tile_height(map_id)); z++)
        {
            var data = tilemap_get_at_pixel(map_id, x + (i * tilemap_get_tile_width(map_id)) + 1, y + (z * tilemap_get_tile_height(map_id)) + 1);
            data = tile_set_empty(data);
            tilemap_set_at_pixel(map_id, data, x + (i * tilemap_get_tile_width(map_id)) + 1, y + (z * tilemap_get_tile_height(map_id)) + 1);
        }
    }
}
