/// void load_entity_mesh(buffer, Entity, version);

load_entity(argument0, argument1, argument2);

argument1.mesh_id=buffer_read(argument0, buffer_string);
argument1.mesh_data=World.all_mesh_map[? argument1.mesh_id];

argument1.am_solid=true;

// no bools

if (argument2>DataVersions.INITIAL){
}
