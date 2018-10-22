/// void battle_round_post_major_status_damage(params);
// 0: position

var pkmn=Battle.contestants[| argument0[| 0]];
var amount=0;
var msg="";

switch (pkmn.status){
    case MajorStatus.POISON:
        amount=pkmn.act[Stats.HP]*World.settings.battle.poison_damage;
        msg=pkmn.name+" was hurt by poison!";
        break;
    case MajorStatus.TOXIC:
        amount=pkmn.act[Stats.HP]*World.settings.battle.toxic_damage_t1*pkmn.status_turn;
        pkmn.status_turn++;
        msg=pkmn.name+" was hurt by poison!";
        break;
    case MajorStatus.BURN:
        amount=pkmn.act[Stats.HP]*World.settings.battle.burn_damage;
        msg=choose_gender(pkmn.gender, pkmn.name+" was hurt by his burn!", pkmn.name+" was hurt by her burn!", pkmn.name+" was hurt by its burn!");
        break;
}

// we say != instead of > because there may be some unusual situations where
// you gain hp from this instead of lose
if (amount!=0){
    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_scroll_health, pkmn, amount));
    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, msg));
    battle_round_action_execute_faint_check(pkmn, pkmn, amount);
}

battle_advance();
