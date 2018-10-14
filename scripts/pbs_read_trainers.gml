/// array pbs_read_trainer_classes(filename);
// the trainer class pbs is a plain text file that isn't in any conventional format.

enum PBSParseTrainerState {
    CLASS,
    NAME,
    SIZE,
    PARTY
}

var state=PBSParseTrainerState.CLASS;
var state_party_index=0;

var text=file_text_as_list(argument0);

var array=array_create(ds_list_size(text));

var class, name, version, party_size, items;
var party=ds_list_create();

for (var i=0; i<ds_list_size(text); i++){
    
    switch (state){
        case PBSParseTrainerState.CLASS:
            class=get_trainer_class_from_name(text[| i]);
            name='';
            version=1;
            party_size=1;
            items=array_create(0);
            ds_list_clear(party);
            state=PBSParseTrainerState.NAME;
            state_party_index=0;
            break;
        case PBSParseTrainerState.NAME:
            var name_split=split(text[| i], ',');
            switch (array_length_1d(name_split)){
                case 2:
                    version=real(name_split[2]);
                case 1:
                    name=name_split[0];
            }
            state=PBSParseTrainerState.SIZE;
            break;
        case PBSParseTrainerState.SIZE:
            var size_split=split(text[| i], ',');
            party_size=real(size_split[0]);
            var n=array_length_1d(size_split);
            if (n>1){
                items=array_create(n-1);
                array_copy(items, 0, size_split, 1, n-1);
            }
            state=PBSParseTrainerState.PARTY;
            break;
        case PBSParseTrainerState.PARTY:
            var terms=split(text[| i], ',');
            
            var species=0;
            var level=5;
            var hold_item=0;
            var moves=noone;
            var ability=0;
            var gender=Genders.MALE;
            var form=0;
            var shiny=false;
            var nature=irandom(array_length_1d(all_natures)-1);
            var iv=10;
            var happiness=70;
            var nick='';
            var shadow=false;
            var ball=0;
            
            switch (array_length_1d(terms)){
                case 17:
                    // at some point you probably want to convert this to the internal item name of the
                    // ball instead and assign a ball id to the item, to keep things simple
                    ball=real(terms[16]);
                case 16:
                    shadow=real(terms[15]);
                case 15:
                    all right im going to sleep, make sure "party" is a property of DataTrainer that gets copied
                    onto each Pawn during battle instead of a property of Pawn
                    
                    therefore pawn_add_pokemon should probably to recast to trainer_add_pokemon
                    
                    also the player should probably be a mutable trainer, whose party and stuff gets modified,
                    so we only have to write one system for managing parties instead of two
                    
                    also also instead of this whole great massive switch tree, just instantiate a pokémon of
                    type terms[0] and level terms[1] and modify its properties from there (all initial values can
                    be calculated knowing only those two values)
                    
                    i think thats it
            }
            
            if (++state_party_index==party_size){
                state=PBSParseTrainerState.CLASS;
            }
            break;
    }
    
    var name='';
    var internal_name='';
    var reward=32;
    var ai=32;
    var battle_bgm=ClassBattleBGM.SILENCE;
    var victory_bgm=ClassVictoryBGM.SILENCE;
    var intro_me=ClassIntroME.SILENCE;
    var gender=Genders.GENDERLESS;
    var ai_notes=array_create(0);
    
    switch (array_length_1d(terms)){
        case 10:
            ai_notes=array_compose(terms[9]);
        case 9:
            ai=real(terms[8]);
        case 8:
            switch (string_lower(terms[7])){
                case "male":
                    gender=Genders.MALE;
                    break;
                case "female":
                    gender=Genders.FEMALE;
                    break;
                case "genderless":
                    gender=Genders.GENDERLESS;
                    break;
            }
        case 7:
            intro_me=get_class_intro_me_from_name(terms[6]);
        case 6:
            victory_bgm=get_class_victory_bgm_from_name(terms[5]);
        case 5:
            battle_bgm=get_class_battle_bgm_from_name(terms[4]);
        case 4:
            reward=real(terms[3]);
        case 3:
            name=terms[2];
        case 2:
            internal_name=terms[1];
    }
    
    array[i]=add_trainer_class(name, reward, battle_bgm, victory_bgm, intro_me, ai, ai_notes, internal_name);
}

ds_list_destroy(text);
ds_list_destroy(party);

return array;
