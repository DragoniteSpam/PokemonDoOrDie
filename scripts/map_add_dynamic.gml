/// void map_add_dynamic(DataMap, Entity, xx, yy, zz);
// Does not check to see if the specified coordinates are in bounds.
// You are responsible for that.

argument1.xx=argument2;
argument1.yy=argument3;
argument1.zz=argument4;

if (argument1.am_solid){
    map_add_solid(argument0, argument1, argument2, argument3, argument4);
}

ds_list_add(argument0.list_dynamic, argument1);
