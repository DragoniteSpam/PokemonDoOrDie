/// void ds_map_read_language(map, language enum);
/*
 * the 
 */

var f=file_text_open_read(PATH_LANGUAGE);

while (!file_text_eof(f)){
    file_text_readln(f);
}

file_text_close(f);
