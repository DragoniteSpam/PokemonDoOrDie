/// void debug(v1, v2, .. vn);

if (DEBUG){
    var str="";
    for (var i=0; i<argument_count; i++){
        str=str+string(argument[i]);
    }
    
    show_debug_message(str);
    
    var f=file_text_open_append(LOG_FILE);
    file_text_write_string(f, str);
    file_text_writeln(f);
    file_text_close(f);
}
