/// array const_egg_groups();

enum EggGroups {
    MONSTER,
    WATER1,
    BUG,
    FLYING,
    FIELD,
    FAIRY,
    GRASS,
    HUMANLIKE,
    WATER3,
    MINERAL,
    AMORPHOUS,
    WATER2,
    DITTO,
    DRAGON,
    UNDISCOVERED,
}

var array;
array=array_create(EggGroups.UNDISCOVERED);

array[EggGroups.MONSTER]=add_egg_group("Monster", false, false);
array[EggGroups.WATER1]=add_egg_group("Water 1", false, false);
array[EggGroups.BUG]=add_egg_group("Bug", false, false);
array[EggGroups.FLYING]=add_egg_group("Flying", false, false);
array[EggGroups.FIELD]=add_egg_group("Field", false, false);
array[EggGroups.FAIRY]=add_egg_group("Fairy", false, false);
array[EggGroups.GRASS]=add_egg_group("Grass", false, false);
array[EggGroups.HUMANLIKE]=add_egg_group("Human-like", false, false);
array[EggGroups.WATER3]=add_egg_group("Water 3", false, false);
array[EggGroups.MINERAL]=add_egg_group("Mineral", false, false);
array[EggGroups.AMORPHOUS]=add_egg_group("Amorphous", false, false);
array[EggGroups.WATER2]=add_egg_group("Water 2", false, false);
array[EggGroups.DITTO]=add_egg_group("Ditto", false, true);
array[EggGroups.DRAGON]=add_egg_group("Dragon", false, false);
array[EggGroups.UNDISCOVERED]=add_egg_group("Undiscovered", true, false);

return array;
