var text_list=ds_list_create();

var trainer=get_trainer(Battle.input_processing.owner.trainer_index);
for (var i=0; i<array_length_1d(trainer.items); i++){
    if (trainer_item_pocket_total(trainer, i)>0){
        ds_list_add(text_list, get_item_pocket(i).name);
    }
}

ds_list_add(text_list, "(Back)");

var max_n=ds_list_size(text_list);

draw_menu_from_list(text_list, World.message_option_index);
World.message_option_index=menu_input(World.message_option_index, max_n);

if (keyboard_check_released(vk_enter)){
    if (World.message_option_index==max_n-1){
        battle_input_processing_reset(false);
    }
}

ds_list_destroy(text_list);
