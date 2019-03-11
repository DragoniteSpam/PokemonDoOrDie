/// DataMap add_map(name, internal name, tileset file);

with (instance_create(0, 0, DataMap)){
    name=argument[0];
    internal_name=argument[1];
    
    var ts_file=PATH_TILESET+argument[2];
    tileset=sprite_add(ts_file, 0, false, false, 0, 0);
    texture=sprite_get_texture(tileset, 0);
    return id;
}
