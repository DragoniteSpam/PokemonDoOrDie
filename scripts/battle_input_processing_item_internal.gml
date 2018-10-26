var text_list=ds_list_create();
var item_list=ds_list_create();

var list=get_trainer(Battle.input_processing.owner.trainer_index).items[argument0];
for (var i=0; i<ds_list_size(list); i++){
    var stack=list[| i];
    if (stack.count>1){
        var suffix=" x "+string(stack.count);
    } else {
        var suffix="";
    }
    ds_list_add(text_list, get_item(stack.index).name+suffix);
    ds_list_add(item_list, stack.index);
}

ds_list_add(text_list, "(Back)");

var max_n=ds_list_size(text_list);

// todo if you play for reasonably long you're probably going to
// accumulate enough items to make the list overflow the screen,
// so it would be a really good idea to make this list scrollable
// at some point in the future
draw_menu_from_list(text_list, World.message_option_index);
World.message_option_index=menu_input(World.message_option_index, max_n);

if (keyboard_check_released(vk_enter)){
    if (World.message_option_index==max_n-1){
        battle_input_processing_reset(false, BattleInputStages.ITEM);
    } else {
        message(Battle.input_processing.owner.name+" elected to use a "+get_item(item_list[| World.message_option_index]).name);
    }
}

ds_list_destroy(text_list);
ds_list_destroy(item_list);
