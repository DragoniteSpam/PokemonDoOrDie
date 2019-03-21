/// void load_map_contents_meta(buffer, version);

var version=argument1;

instance_destroy(DataMap);
instance_create(0, 0, DataMap);

var map=get_active_map();

map.name=buffer_read(argument0, buffer_string);
map.internal_name=buffer_read(argument0, buffer_string);
map.summary=buffer_read(argument0, buffer_string);

var xx=buffer_read(argument0, buffer_u16);
var yy=buffer_read(argument0, buffer_u16);
var zz=buffer_read(argument0, buffer_u16);

map.tileset=buffer_read(argument0, buffer_u8);

I don''t know what the equivalent of this script is in the game offhand and I have to go
to class in three minutes so it can be someone else''s problem (i.e. me later tonight)
data_resize_map(xx, yy, zz);
