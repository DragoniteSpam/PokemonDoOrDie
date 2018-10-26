/// void bi_post_turn_leftovers(queue, BattlePokemon, item);

if (argument1.act_hp<argument1.act[Stats.HP]){
    // there are some conditions that can cause this to fail such as
    // Heal Block effects or probably the Klutz ability, but none of them
    // are going to come into play here
    var item=get_item(argument2);
    // todo hold item animation
    var amount=min(floor(argument1.act[Stats.HP]/16), argument1.act[Stats.HP]-argument1.act_hp);
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_scroll_health, argument1, -amount));
    var text=choose_gender(argument1.gender, argument1.name+" restored a bit of health with his "+item.name+"!",
        argument1.name+" restored a bit of health with her "+item.name+"!",
        argument1.name+" restored a bit of health with its "+item.name+"!",);
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, text));
}
