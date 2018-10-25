/// array pbs_read_items(filename);
// the item pbs is a csv.

var text=file_text_as_list(argument0);

var array=array_create(ds_list_size(text));

for (var i=0; i<ds_list_size(text); i++){
    var terms=split(text[| i], ',', false);
    
    var internal_name='';
    var name='';
    var plural='';
    var pocket=1;
    var price=0;
    var description='';
    var overworld=0;
    var battle=0;
    var special=0;
    var move=-1;
    
    switch (array_length_1d(terms)){
        case 11:
            move=get_move_from_name(terms[10], true);
        case 10:
            // todo convert this into some other less clunky piece of data
            special=real(terms[9]);
        case 9:
            // todo convert this into some other less clunky piece of data
            battle=real(terms[8]);
        case 8:
            // todo convert this into some other less clunky piece of data
            overworld=real(terms[7]);
        case 7:
            description=terms[6];
        case 6:
            price=real(terms[5]);
        case 5:
            pocket=get_item_pocket_from_name(terms[4]);
        case 4:
            plural=terms[3];
        case 3:
            name=terms[2];
        case 2:
            internal_name=terms[1];
    }
    
    array[i]=add_item(name, plural, pocket, price, overworld, battle, special, move, description, internal_name);
}

ds_list_destroy(text);

return array;
