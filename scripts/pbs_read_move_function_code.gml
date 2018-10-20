/// array pbs_read_move_function_code(hex string);

var value=hex(argument0);

// todo sort these out

var effects=array_create(1);
effects[0]=null;

switch (value){
    case 0:
        break;
    default:
        effects[0]=be_not_implemented;
        break;
}

return effects;
