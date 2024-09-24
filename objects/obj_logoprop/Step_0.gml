var d = 0.03
scr_getinput()
if keyboard_check_pressed(vk_anykey)
    instance_destroy()
if fadein
    image_alpha = approach(image_alpha, 1, d)
else
{
    image_alpha = approach(image_alpha, 0, d)
    if (image_alpha <= 0)
        instance_destroy()
}
var cur = date_current_datetime()
var date = date_compare_time(date_create_datetime(date_get_year(cur), date_get_month(cur), date_get_day(cur), 7, date_get_minute(cur), date_get_second(cur)), date_current_datetime())
var date2 = date_compare_time(date_create_datetime(date_get_year(cur), date_get_month(cur), date_get_day(cur), 20, date_get_minute(cur), date_get_second(cur)), date_current_datetime())
if (date == -1 && date2 == 1)
    image_index = 0
else
    image_index = 1
