/// array split(string, delimiter);

// im not sure if this will not blow up or not
if (string_length(argument0)==0){
    return array_create(0);
}

var index=0;
var terms;
terms[0]="";
for (var i=1; i<=string_length(argument0); i++){
    if (string_char_at(argument0, i)==argument1){
        terms[++index]="";
    } else {
        terms[index]=terms[index]+string_char_at(argument0, i);
    }
}

return terms;
