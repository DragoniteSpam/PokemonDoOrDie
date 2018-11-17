/// void map_add_solid(DataMap, Entity, xx, yy, zz);
// Does not check to see if the specified coordinates are in bounds.
// You are responsible for that.

var slice=argument0.contents_collision[# argument2, argument3]
var cell=slice[argument4];

if (cell==noone){
    cell=ds_list_create();
    slice[@ argument4]=cell;
}

ds_list_add(cell, argument1);
