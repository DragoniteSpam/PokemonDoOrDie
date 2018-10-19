/// String string_pad(value, zeroes);

var str=string(argument0);

while (string_length(str)<argument1){
    str="0"+str;
}

return str;
