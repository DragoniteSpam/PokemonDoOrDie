/// Pawn pawn_create(class internal name, name, xx, yy, zz, [version], [object], [displayname]);

var pname, pclass;
var pversion=1;
var pdisplayname='';
var ptype=Pawn;
var xx=0;
var yy=0;
var zz=0;

switch (argument_count){
    case 8:
        pdisplayname=argument[7];
    case 7:
        ptype=argument[6];
    case 6:
        pversion=argument[5];
    case 5:
        zz=argument[4];
    case 4:
        yy=argument[3];
    case 3:
        xx=argument[2];
    case 2:
        pname=argument[1];
    case 1:
        // I don't like doing this but without a trainer types enum
        // it's going to be very difficult to do this, and I don't
        // want to use a trainer type enum because it would make
        // adding new data that much more annoying.
        // In the future, pawns will preferably be added through code
        // and you can bypass the trainer class names entirely.
        pclass=get_trainer_class_from_name(argument[0], true);
        break;
}

if (string_length(pdisplayname)==0){
    pdisplayname=get_trainer_class(pclass).name+' '+pname;
}

var class_data=get_trainer_class(pclass);

with (instance_create(0, 0, ptype)){
    id.xx=xx;
    id.yy=yy;
    id.zz=zz;
    map_add_dynamic(get_active_map(), id, xx, yy, zz);
    
    trainer_index=get_trainer_from_data(pname, pclass, pversion);

    ds_list_copy(party, get_trainer(trainer_index).party);
    
    name=pdisplayname;
    
    // defaults
    battle_sprite=get_class_battle_sprite(class_data.battle_sprite);
    overworld_sprite=get_class_overworld_sprite(class_data.overworld_sprite);
    // do audio later
    
    return id;
}
