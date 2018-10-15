/// void battle_input_processing_control_switch_before_turn();
// Of course, you could not hard-code this behavior. In fact, if you're
// trying to make a custom battle system, I suggest you do that. But in
// the meantime I'm going to hard-code this.

if (keyboard_check_released(vk_enter)){
    // There are a couple of ways to handle this, some more optimized
    // than others, none of which I'm a fan of. This one's probably the
    // least typing though.
    if (Battle.input_index==ds_list_size(Camera.battle_pawn.party)){
        switch (Battle.input_stage){
            case BattleInputStages.SWITCH:
                // nothing special
                battle_input_processing_reset();
                break;
            case BattleInputStages.SWITCH_BEFORE_TURN:
                battle_input_processing_reset();
                battle_advance();
                break;
        }
    } else {
        switch (Battle.input_stage){
            case BattleInputStages.SWITCH:
                break;
            case BattleInputStages.SWITCH_BEFORE_TURN:
                break;
        }
    }
}
