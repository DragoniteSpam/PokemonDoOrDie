/// void babl_round_end_shed_skin(queue, BattlePokemon, ability);

if (argument1.status!=MajorStatus.NONE){
    if (random(100)<World.settings.battle.ability_shed_skin_heal_rate){
        ds_queue_enqueue(argument0, add_battle_round_action(battle_individual_action_set_major_status, argument1, MajorStatus.NONE, 0));
        var text=choose_gender(argument1.gender, argument1.name+"'s "+argument2.name+" cured his "+string_lower(World.major_status_names[argument1.status])+"!",
            argument1.name+"'s "+argument2.name+" cured her "+string_lower(World.major_status_names[argument1.status])+"!",
            argument1.name+"'s "+argument2.name+" cured its "+string_lower(World.major_status_names[argument1.status])+"!");
        ds_queue_enqueue(argument0, add_battle_round_action(battle_round_action_text, text));
    }
}
