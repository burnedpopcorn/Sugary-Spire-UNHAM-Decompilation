function __view_set_internal(argument0, argument1, argument2)
{
    switch (argument0)
    {
        case 0:
            var __cam = view_get_camera(argument1);
            camera_set_view_pos(__cam, argument2, camera_get_view_y(__cam));
            break;
        
        case 1:
            var __cam = view_get_camera(argument1);
            camera_set_view_pos(__cam, camera_get_view_x(__cam), argument2);
            break;
        
        case 2:
            var __cam = view_get_camera(argument1);
            camera_set_view_size(__cam, argument2, camera_get_view_height(__cam));
            break;
        
        case 3:
            var __cam = view_get_camera(argument1);
            camera_set_view_size(__cam, camera_get_view_width(__cam), argument2);
            break;
        
        case 4:
            var __cam = view_get_camera(argument1);
            camera_set_view_angle(__cam, argument2);
            break;
        
        case 5:
            var __cam = view_get_camera(argument1);
            camera_set_view_border(__cam, argument2, camera_get_view_border_y(__cam));
            break;
        
        case 6:
            var __cam = view_get_camera(argument1);
            camera_set_view_border(__cam, camera_get_view_border_x(__cam), argument2);
            break;
        
        case 7:
            var __cam = view_get_camera(argument1);
            camera_set_view_speed(__cam, argument2, camera_get_view_speed_y(__cam));
            break;
        
        case 8:
            var __cam = view_get_camera(argument1);
            camera_set_view_speed(__cam, camera_get_view_speed_x(__cam), argument2);
            break;
        
        case 9:
            var __cam = view_get_camera(argument1);
            camera_set_view_target(__cam, argument2);
            break;
        
        case 10:
            __res = view_set_visible(argument1, argument2);
            break;
        
        case 11:
            __res = view_set_xport(argument1, argument2);
            break;
        
        case 12:
            __res = view_set_yport(argument1, argument2);
            break;
        
        case 13:
            __res = view_set_wport(argument1, argument2);
            break;
        
        case 14:
            __res = view_set_hport(argument1, argument2);
            break;
        
        case 15:
            __res = view_set_camera(argument1, argument2);
            break;
        
        case 16:
            __res = view_set_surface_id(argument1, argument2);
            break;
        
        default:
            break;
    }
    
    return 0;
}
