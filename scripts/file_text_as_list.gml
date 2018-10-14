/// list file_text_as_list(filename);

var f=file_text_open_read(argument0);
var text=ds_list_create();
while (!file_text_eof(f)){
    var line=file_text_read_string(f);
    // comments aren't a thing in the unmodified pbs but there's a chance
    // that some people might want to use them
    if (string_char_at(line, 1)!='#'){
        ds_list_add(text, line);
    }
    file_text_readln(f);
}

file_text_close(f);

return text;
