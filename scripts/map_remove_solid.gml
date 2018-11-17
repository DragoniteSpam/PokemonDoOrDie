/// void map_remove_solid(DataMap, Entity, xx, yy, zz);
// Does not check to see if the specified coordinates are in bounds.
// You are responsible for that.

var slice=argument0.contents_collision[# argument2, argument3]
var cell=slice[argument4];

// if the specified object cannot be found at (x, y, z) the game
// will crash. do not remove solid Entities from locations where
// they cannot be found.

ds_list_delete(cell, ds_list_find_index(cell, argument1));
