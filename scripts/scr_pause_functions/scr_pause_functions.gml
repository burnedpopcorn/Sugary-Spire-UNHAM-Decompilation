function scr_create_pause_image() //scr_create_pause_image
{
    var cam_x = camera_get_view_x(view_camera[0])
    var cam_y = camera_get_view_y(view_camera[0])
    var cam_w = camera_get_view_width(view_camera[0])
    var cam_h = camera_get_view_height(view_camera[0])
    draw_set_alpha(1)
    screensprite = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0)
    screenscale = min(((cam_x + cam_w) / surface_get_width(application_surface)), ((cam_y + cam_h) / surface_get_height(application_surface)))
}

function scr_draw_pause_image() //scr_draw_pause_image
{
    cam_x = camera_get_view_x(view_camera[0])
    cam_y = camera_get_view_y(view_camera[0])
    cam_w = camera_get_view_width(view_camera[0])
    cam_h = camera_get_view_height(view_camera[0])
    draw_rectangle_color(0, 0, (cam_x + cam_w), (cam_y + cam_h), c_black, c_black, c_black, c_black, false)
    draw_sprite_ext(screensprite, 0, 0, 0, 1, 1, 0, c_white, 1)
}

function scr_delete_pause_image() //scr_delete_pause_image
{
    if sprite_exists(screensprite)
        sprite_delete(screensprite)
}

function scr_roomreset(argument0) //scr_roomreset
{
    var roomname = room_get_name(room)
    if (argument0 == true)
    {
        if (string_letters(roomname) == "entryway" || string_letters(roomname) == "entrywaynew" || string_letters(roomname) == "entrywaysecret" || room == entryway_portal || string_letters(roomname) == "steamy" || string_letters(roomname) == "steamysecret" || room == steamy_portal || string_letters(roomname) == "molasses" || string_letters(roomname) == "molassesb" || string_letters(roomname) == "molassesc" || string_letters(roomname) == "molassesd" || string_letters(roomname) == "molassessecret" || room == molasses_portal || string_letters(roomname) == "mines" || string_letters(roomname) == "minesB" || string_letters(roomname) == "minessecret" || room == mines_portal || room == room_treasure)
            return true;
        return false;
    }
    else
    {
        if (room != rank_room && room != hub_room1 && room != hub_public && room != outer_room1 && room != outer_room2 && room != scootercutsceneidk && room != rm_verify && room != hub_bikinibottom && room != hub_bikinibottomtest)
            return true;
        if (room == hub_room1 || room == hub_public || room == outer_room1 || room == outer_room2 || room == scootercutsceneidk || room == secrets_await || room == devroom || room == hub_bikinibottom || room == hub_bikinibottomtest)
            return true;
        return false;
    }
}

