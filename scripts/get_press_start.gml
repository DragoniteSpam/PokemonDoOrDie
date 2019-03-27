/// boolean get_press_start([clear?]);

var s=Controller.press_start;

if (argument_count==0||argument[0]){
    Controller.press_start=false;
}

return s;
