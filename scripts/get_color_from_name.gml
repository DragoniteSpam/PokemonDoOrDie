/// color get_color_from_name(name);

switch (string_minimal(argument0)){
    case "black":
        return c_black;
    case "blue":
        return c_blue;
    case "brown":
        return c_brown;
    case "gray":
        return c_gray;
    case "green":
        return c_green;
    case "pink":
        return c_pink;
    case "purple":
        return c_purple;
    case "red":
        return c_red;
    case "white":
        return c_white;
    case "yellow":
        return c_yellow;
}

// i'm guessing you're rarely going to get to this but just in case
// (if you omit this the script will return 0, which is also c_black)
return c_white;
