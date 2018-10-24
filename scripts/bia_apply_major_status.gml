/// boolean bia_apply_major_status(queue, nullable user, target, status, status turn, nullable DataMove);
// So you don't have to write the code that checks for Synchronize
// and Magic Bounce and all that other stuff every time you want to
// apply a major status.

var queue=argument0;
var user=argument1;
var target=argument2;
var status=argument3;
var status_turn=argument4;
var move=argument5;

// If you call this from one of the contact ability scripts, or something
// of that nature, remember to reverse the "user" and "target" arguments.

// todo each status should have an animation to go with it.

if (pokemon_can_have_status(target, status)){
    switch (target.ability.status_acceptance[status]){
        case StatusAcceptance.YES:
            ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_major_status, target, status, status_turn));
            ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, target.name+" "+World.major_status_verbs[status]+"!"));
            return true;
        case StatusAcceptance.MIRROR:
            ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_major_status, target, status, status_turn));
            ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, target.name+" "+World.major_status_verbs[status]+"!"));
            if (user!=noone&&move!=noone&&pokemon_can_have_status(user, status)){
                // todo show target ability card thing
                ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_major_status, user, status, status_turn));
                ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, user.name+" "+World.major_status_verbs[status]+" by "+target.name+"'s "+target.ability.name+"!"));
            }
            return true;
        case StatusAcceptance.BOUNCE:
            // Items, Abilities and non-status moves can't trigger Magic Bounce
            if (move!=noone&&move!=noone&&move.category==MoveCategories.STATUS){
                // todo show target ability card thing
                // i don't remember if magic bounce kicks in if the user is immune to the status they're
                // trying to inflict. if you want that to happen, move the "can have status" check to the
                // outer check.
                if (pokemon_can_have_status(user, status)){
                    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_major_status, user, status, status_turn));
                    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, user.name+" "+World.major_status_verbs[status]+" by "+target.name+"'s "+target.ability.name+" instead!"));
                }
            } else {
                ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_set_major_status, target, status, status_turn));
                ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, target.name+" "+World.major_status_verbs[status]+"!"));
                return true;
            }
            break;
    }
}

return false;
