/// void map_add_static(DataMap, Entity, xx, yy, zz);
// Does not check to see if the specified coordinates are in bounds.
// You are responsible for that.

argument1.xx=argument2;
argument1.yy=argument3;
argument1.zz=argument4;

var array=argument0.contents_static[# argument2, argument3];
// if there was already a value in the location that you are adding
// to, it will be orphaned! make sure that does not happen!
array[@ argument4]=argument1;
