/// int get_type_from_name(name, [use internal name?]);

switch (argument_count){
    case 2:
        return get_generic_from_name(World.all_types, argument[0], argument[1]);
}

return get_generic_from_name(World.all_types, argument[0]);
