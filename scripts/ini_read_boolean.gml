/// boolean ini_read_boolean(section, key, default);

var text=string_lower(ini_read_string(argument0, argument1, argument2));

switch (text){
    case "true":
    case "1":
        return true;
    case "false":
    case "0":
        return false;
}

show_error("you tried to read a boolean out of a non-boolean: "+text, true);
