/// void map_add_static(DataMap, Entity, xx, yy, zz);
// Does not check to see if the specified coordinates are in bounds.
// You are responsible for that.

argument1.xx=argument2;
argument1.yy=argument3;
argument1.zz=argument4;
argument1.target_xx=argument2;
argument1.target_yy=argument3;
argument1.target_zz=argument4;
argument1.previous_xx=argument2;
argument1.previous_yy=argument3;
argument1.previous_zz=argument4;

map_add_contents(argument0, argument1, argument2, argument3, argument4);

ds_list_add(argument0.list_static, argument1);
