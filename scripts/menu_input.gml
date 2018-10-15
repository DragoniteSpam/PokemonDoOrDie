/// int menu_input(n, list size);
// search for examples of this script (control+shift+f) to see how it works
// important: argument1 should be the SIZE OF THE LIST. NOT the largest value.
// this script treats the largest value as list size minus one.

if (keyboard_check_released(vk_up)||keyboard_check_released(ord('W'))){
    return max(--argument0, 0);
} else if (keyboard_check_released(vk_down)||keyboard_check_released(ord('S'))){
    return min(++argument0, argument1-1);
} else if (keyboard_check_released(vk_left)||keyboard_check_released(ord('A'))){
    return 0;
} else if (keyboard_check_released(vk_right)||keyboard_check_released(ord('D'))){
    return argument1-1;
}

return argument0;
