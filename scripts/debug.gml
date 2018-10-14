/// void debug(string);

if (DEBUG&&string_length(argument0)>0){
    show_debug_message(argument0);
    
    var f=file_text_open_append(LOG_FILE);
    file_text_write_string(f, argument0);
    file_text_writeln(f);
    file_text_close(f);
}
