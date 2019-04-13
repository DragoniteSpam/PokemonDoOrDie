/// scr_help_add_item(guid, quantity);

var pocket_index=scr_help_get_item_pocket_index(argument0);

if (pocket_index==-1){
    debug("item pocket not found: "+guid_get(argument0).name);
} else {
    var pocket=World.player.inventory[pocket_index];
    var current=scr_help_has_item(argument0);
    
    if (current==-1){
        ds_list_add(pocket, array_compose(argument0, argument1));
    } else {
        var stack=pocket[| current];
        stack[@ 1]=stack[@ 1]+argument1;
        pocket[| current]=stack;
    }
}
