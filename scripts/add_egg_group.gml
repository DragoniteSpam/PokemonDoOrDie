/// DataEggGroup add_egg_group(name, restricted?, unrestricted?);

with (instance_create(0, 0, DataEggGroup)){
    name=argument0;
    restricted=argument1;
    unrestricted=argument2;
    
    return id;
}
