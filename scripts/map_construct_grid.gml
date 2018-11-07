/// grid map_construct_grid(x, y, z);
// There are no 3D data structures in Game Maker so we have to chain some
// lower-order ones together.

var grid=ds_grid_create(argument0, argument1);

for (var i=0; i<argument0; i++){
    for (var j=0; j<argument1; j++){
        grid[# i, j]=array_create(argument2);
        array_clear(grid[# i, j], noone);
    }
}

return grid;
