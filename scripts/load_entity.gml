/// bool load_entity(buffer, Entity, version);

argument1.name=buffer_read(argument0, buffer_string);
argument1.xx=buffer_read(argument0, buffer_u32);
argument1.yy=buffer_read(argument0, buffer_u32);
argument1.zz=buffer_read(argument0, buffer_u32);

var entity_bools=buffer_read(argument0, buffer_u32);
argument1.am_solid=unpack(entity_bools, 0);
// this is handled differently here than it is in the editor -
// it's not actually needed since static things are stored in a
// different section in the file than dynamic ones, but it is used
// to determine how things are added to the map, and if you need
// it it's here
var static=unpack(entity_bools, 1);

// when you add things on you're probably going to append them to the
// end so the cascading switch statement won't work, so check each old
// version in ascending order

if (argument2>DataVersions.INITIAL){
}

// this should not be instantiated on its own and does not
// get collision information

return static;
