/// void load_autotiles_meta(buffer, version);

var version=argument1;

var n_autotiles=buffer_read(argument0, buffer_u16);
// garbage collection is great
World.available_autotiles=array_create(n_autotiles);

for (var i=0; i<n_autotiles; i++){
    var exists=buffer_read(argument0, buffer_u8);
    
    if (exists){
        var at_picture=buffer_read(argument0, buffer_u16);
        /*var at_name=*/buffer_read(argument0, buffer_string);
        var at_deleteable=buffer_read(argument0, buffer_u8);
        var at_filename=buffer_read(argument0, buffer_string);
        var at_frames=buffer_read(argument0, buffer_u8);
        var at_width=buffer_read(argument0, buffer_u8);
        
        if (at_deleteable){
            at_picture=sprite_add_autotile(at_filename);
            if (!sprite_exists(at_picture)){
                at_picture=b_at_default_error;
            }
        }
        
        // we don't need name, deleteable or filename after this point
        World.available_autotiles[i]=array_compose(at_picture, at_frames, at_width);
    } else {
        World.available_autotiles[i]=noone;
    }
}
