function rousr_dissonance_handler_on_disconnected(argument0) //rousr_dissonance_handler_on_disconnected
{
    var _user_data = (argument_count > 1 ? argument[1] : undefined)
    with (global.__rousr_dissonance)
        array_set(Handlers, 1, [argument0, _user_data])
}

