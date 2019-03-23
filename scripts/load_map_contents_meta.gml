/// void load_map_contents_meta(buffer, version);

var version=argument1;

instance_activate_object(DataMap);
instance_destroy(DataMap);

var m_name=buffer_read(argument0, buffer_string);
var m_internal_name=buffer_read(argument0, buffer_string);
var m_summary=buffer_read(argument0, buffer_string);

var xx=buffer_read(argument0, buffer_u16);
var yy=buffer_read(argument0, buffer_u16);
var zz=buffer_read(argument0, buffer_u16);

var m_tileset=buffer_read(argument0, buffer_u8);

var map=add_map(m_name, m_internal_name, m_tileset);
map_construct_grids(map, xx, yy, zz);
