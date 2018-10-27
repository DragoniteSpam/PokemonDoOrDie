/// string L(text, v0, .. vn);

var text=argument[0];

// you can't actually print out a % followed by a number this
// way. if people actually need to do that for some reason i
// might fix it but until then it's staying like this.
for (var i=1; i<argument_count; i++){
    text=string_replace_all(text, '%'+string(i-1), string(argument[i]));
}

return text;
