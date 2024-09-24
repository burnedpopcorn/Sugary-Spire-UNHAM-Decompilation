function safe_get(argument0, argument1) //safe_get
{
    if instance_exists(argument0)
        return variable_instance_get(argument0, argument1);
    return undefined;
}

