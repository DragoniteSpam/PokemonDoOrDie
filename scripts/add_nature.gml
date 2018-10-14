/// DataMove add_move(name, hp, atk, def, spam spd, spe);
// if you want to do like contest stats or something you might want to modify this script

with (instance_create(0, 0, DataNature)){
    name=argument0;
    
    array_copy(affects, 0, argument, 1, 6);
    
    return id;
}
