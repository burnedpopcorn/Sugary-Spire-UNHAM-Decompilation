var _add_spot, spot, head;

if (obj_player.character == "N")
{
    _add_spot = function(argument0, argument1, argument2)
    {
        var q;
        
        q = 
        {
            x: argument0,
            y: argument1,
            scale: argument2
        };
        trace("Adding noise head spot at: ", q);
        array_push(noisespots, q);
        return q;
    };
    
    noisespot_buffermax = 10;
    
    switch (titlecard_sprite)
    {
        case spr_crunchytitlecard:
            _add_spot(674, 341, 0.6);
            _add_spot(272, 363, 0.65);
            break;
        
        case spr_cottontitlecard:
            _add_spot(286, 337, 0.6);
            _add_spot(454, 444, 0.5);
            break;
        
        case spr_molassestitlecard:
            _add_spot(294, 119, 0.8);
            _add_spot(312, 405, 0.67);
            break;
        
        case spr_sugarshacktitlecard:
            _add_spot(540, 330, 0.83);
            _add_spot(496, 115, 0.6);
            break;
    }
    
    for (i = 0; i < array_length(noisespots); i++)
    {
        spot = noisespots[i];
        head = 
        {
            x: spot.x,
            y: spot.y,
            scale: spot.scale,
            visual_scale: 1,
            visible: false,
            image_index: irandom(sprite_get_number(spr_pizzano_stickers) - 1)
        };
        trace("Adding noise head at: ", head);
        array_push(noisehead, head);
    }
    
    noisehead_pos = 0;
    alarm[2] = 40;
}

/*
if (obj_player.character == "N")
{
    //function anon@142@gml_Object_obj_titlecard_Alarm_1(argument0, argument1, argument2) //anon@142@gml_Object_obj_titlecard_Alarm_1
    function _add_spot(argument0, argument1, argument2)
	{
        var q = 
        {
            x: argument0,
            y: argument1,
            scale: argument2
        }

        trace("Adding noise head spot at: ", q)
        array_push(noisespots, q)
        return q;
    }

    noisespot_buffermax = 10
    switch titlecard_sprite
    {
        case spr_crunchytitlecard:
            self._add_spot(674, 341, 0.6)
            self._add_spot(272, 363, 0.65)
            break
        case spr_cottontitlecard:
            self._add_spot(286, 337, 0.6)
            self._add_spot(454, 444, 0.5)
            break
        case spr_molassestitlecard:
            self._add_spot(294, 119, 0.8)
            self._add_spot(312, 405, 0.67)
            break
        case spr_sugarshacktitlecard:
            self._add_spot(540, 330, 0.83)
            self._add_spot(496, 115, 0.6)
            break
    }

    for (i = 0; i < array_length(noisespots); i++)
    {
        var spot = noisespots[i]
        var head = 
        {
            x: spot.x,
            y: spot.y,
            scale: spot.scale,
            visual_scale: 1,
            visible: false,
            image_index: irandom(sprite_get_number(spr_pizzano_stickers) - 1)
        }

        trace("Adding noise head at: ", head)
        array_push(noisehead, head)
    }
    noisehead_pos = 0
    alarm[2] = 40
}
