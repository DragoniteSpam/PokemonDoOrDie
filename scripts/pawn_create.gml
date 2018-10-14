/// Pawn pawn_create(name, [object]);

var pname='';
var ptype=Pawn;
switch (argument_count){
    case 2:
        ptype=argument[1];
    case 1:
        pname=argument[0];
        break;
}

with (instance_create(0, 0, ptype)){
    name=pname;
    
    return id;
}
