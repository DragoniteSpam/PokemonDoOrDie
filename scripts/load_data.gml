/// void load_data([file]);

if (argument_count==0){
    var datafile=PATH_DATA+'game.dddd';
} else {
    var datafile=PATH_DATA+argument[0];
}

var original=buffer_load(datafile);
var erroneous=false;
var header=chr(buffer_read(original, buffer_u8))+chr(buffer_read(original, buffer_u8))+chr(buffer_read(original, buffer_u8));

if (header=="DDD"){
    // if it's uncompressed, don't decompress it
    var buffer=original;
} else {
    // if it's compressed, decompress it - if possible
    var buffer=buffer_inflate(original, 0, buffer_get_size(original));
    buffer_delete(original);
}

if (buffer==-1){
    erroneous=true;
} else {
    buffer_seek(buffer, buffer_seek_start, 0);
    
    /*
     * Header
     */
    
    var header=chr(buffer_read(buffer, buffer_u8))+chr(buffer_read(buffer, buffer_u8))+chr(buffer_read(buffer, buffer_u8));
    
    if (header=="DDD"){
        var version=buffer_read(buffer, buffer_u32);
        var what=buffer_read(buffer, buffer_u8);
        var things=buffer_read(buffer, buffer_u32);
        
        /*
         * data types
         */
        
        if (what==SERIALIZE_MAP){
            repeat(things){
                switch (datatype){
                    case SerializeThings.MAP_META:
                        load_map_contents_meta(buffer, version);
                        break;
                    case SerializeThings.MAP_BATCH:
                        load_map_contents_batch(buffer, version);
                        break;
                    case SerializeThings.MAP_DYNAMIC:
                        load_map_contents_dynamic(buffer, version);
                        break;
                }
            }
        } else {
            repeat(things){
                var datatype=buffer_read(buffer, buffer_datatype);
                switch (datatype){
                    // game stuff
                    case SerializeThings.AUTOTILES_META:
                        load_autotiles_meta(buffer, version);
                        break;
                    case SerializeThings.TILESET_META:
                        load_tilesets_meta(buffer, version);
                        break;
                    case SerializeThings.EVENTS:
                        load_events(buffer, version);
                        break;
                    case SerializeThings.MISC_MAP_META:
                        load_global_meta(buffer, version);
                        break;
                }
            }
        }
        
        instance_deactivate_object(Struct);
        buffer_delete(buffer);
    } else {
        erroneous=true;
    }
}

if (erroneous){
    show_error("Bad game data file, can't load: "+datafile, true);
}

show_message("good? good")

enum DataVersions {
    INITIAL                     =0,
    VRAX_REFERENCE              =1,
    STARTING_MAP                =2,
}
