/// int get_trainer_from_name(name, class, [version]);

var name=string_minimal(argument[0]);
var class=argument[1];
var version=1;

switch (argument_count){
    case 3:
        version=argument[2];
    default:
        break;
}

for (var i=0; i<array_length_1d(World.all_trainers); i++){
    if (string_minimal(World.all_trainers[i].name)==name&&World.all_trainers[i].version==version){
        return i;
    }
}

return -1;
