/// void add_evolution(target, type, value);

with (instance_create(0, 0, DataEvolution)){
    target=argument0;
    value=argument2;
    
    if (is_real(argument1)){
        type=argument1;
    } else {
        switch (string_lower(argument1)){
            case "happiness":
                type=EvolutionMethods.HAPPINESS;
                break;
            case "happinessday":
                type=EvolutionMethods.HAPPINESSDAY;
                break;
            case "happinessnight":
                type=EvolutionMethods.HAPPINESSNIGHT;
                break;
            case "level":
                type=EvolutionMethods.LEVEL;
                break;
            case "trade":
                type=EvolutionMethods.TRADE;
                break;
            case "tradeitem":
                type=EvolutionMethods.TRADEITEM;
                break;
            case "item":
                type=EvolutionMethods.ITEM;
                break;
            case "attackgreater":
                type=EvolutionMethods.ATTACKGREATER;
                break;
            case "atkdefequal":
                type=EvolutionMethods.ATKDEFEQUAL;
                break;
            case "defensegreater":
                type=EvolutionMethods.DEFENSEGREATER;
                break;
            case "silcoon":
                type=EvolutionMethods.SILCOON;
                break;
            case "cascoon":
                type=EvolutionMethods.CASCOON;
                break;
            case "ninjask":
                type=EvolutionMethods.NINJASK;
                break;
            case "shedinja":
                type=EvolutionMethods.SHEDINJA;
                break;
            case "beauty":
                type=EvolutionMethods.BEAUTY;
                break;
            case "itemmale":
                type=EvolutionMethods.ITEMMALE;
                break;
            case "itemfemale":
                type=EvolutionMethods.ITEMFEMALE;
                break;
            case "dayholditem":
                type=EvolutionMethods.DAYHOLDITEM;
                break;
            case "nightholditem":
                type=EvolutionMethods.NIGHTHOLDITEM;
                break;
            case "hasmove":
                type=EvolutionMethods.HASMOVE;
                break;
            case "hasinparty":
                type=EvolutionMethods.HASINPARTY;
                break;
            case "levelmale":
                type=EvolutionMethods.LEVELMALE;
                break;
            case "levelfemale":
                type=EvolutionMethods.LEVELFEMALE;
                break;
            case "location":
                type=EvolutionMethods.LOCATION;
                break;
            case "tradespecies":
                type=EvolutionMethods.TRADESPECIES;
                break;
            case "levelday":
                type=EvolutionMethods.LEVELDAY;
                break;
            case "levelnight":
                type=EvolutionMethods.LEVELNIGHT;
                break;
            case "leveldarkinparty":
                type=EvolutionMethods.LEVELDARKINPARTY;
                break;
            case "levelrain":
                type=EvolutionMethods.LEVELRAIN;
                break;
            case "happinessmovetype":
                type=EvolutionMethods.HAPPINESSMOVETYPE;
                break;
        }
    }
    return id;
}
