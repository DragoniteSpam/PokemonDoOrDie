debug("remember to define natures at some point");

enum Natures {
    HARDY,
    LONELY,
    BRAVE,
    ADAMANT,
    NAUGHTY,
    BOLD,
    DOCILE,
    RELAXED,
    IMPISH,
    LAX,
    TIMID,
    HASTY,
    SERIOUS,
    JOLLY,
    NAIVE,
    MODEST,
    MILD,
    QUIET,
    BASHFUL,
    RASH,
    CALM,
    GENTLE,
    SASSY,
    CAREFUL,
    QUIRKY
}

var array=array_create(Natures.QUIRKY);

array[Natures.HARDY]=add_nature_stats("Hardy");
array[Natures.LONELY]=add_nature_stats("Lonely", Stats.ATTACK, Stats.DEFENSE);
array[Natures.BRAVE]=add_nature_stats("Brave", Stats.ATTACK, Stats.SPEED);
array[Natures.ADAMANT]=add_nature_stats("Adamant", Stats.ATTACK, Stats.SPATTACK);
array[Natures.NAUGHTY]=add_nature_stats("Naughty", Stats.ATTACK, Stats.SPDEFENSE);
array[Natures.BOLD]=add_nature_stats("Bold", Stats.DEFENSE, Stats.ATTACK);
array[Natures.DOCILE]=add_nature_stats("Docile");
array[Natures.RELAXED]=add_nature_stats("Relaxed", Stats.DEFENSE, Stats.SPEED);
array[Natures.IMPISH]=add_nature_stats("Impish", Stats.DEFENSE, Stats.SPATTACK);
array[Natures.LAX]=add_nature_stats("Lax", Stats.DEFENSE, Stats.SPDEFENSE);
array[Natures.TIMID]=add_nature_stats("Timid", Stats.SPEED, Stats.ATTACK);
array[Natures.HASTY]=add_nature_stats("Hasty", Stats.SPEED, Stats.DEFENSE);
array[Natures.SERIOUS]=add_nature_stats("Serious");
array[Natures.JOLLY]=add_nature_stats("Jolly", Stats.SPEED, Stats.SPATTACK);
array[Natures.NAIVE]=add_nature_stats("Naive", Stats.SPEED, Stats.SPDEFENSE);
array[Natures.MODEST]=add_nature_stats("Modest", Stats.SPATTACK, Stats.ATTACK);
array[Natures.MILD]=add_nature_stats("Mild", Stats.SPATTACK, Stats.DEFENSE);
array[Natures.QUIET]=add_nature_stats("Quiet", Stats.SPATTACK, Stats.SPEED);
array[Natures.BASHFUL]=add_nature_stats("Bashful");
array[Natures.RASH]=add_nature_stats("Rash", Stats.SPATTACK, Stats.SPDEFENSE);
array[Natures.CALM]=add_nature_stats("Calm", Stats.SPDEFENSE, Stats.ATTACK);
array[Natures.GENTLE]=add_nature_stats("Gentle", Stats.SPDEFENSE, Stats.DEFENSE);
array[Natures.SASSY]=add_nature_stats("Sassy", Stats.SPDEFENSE, Stats.SPEED);
array[Natures.CAREFUL]=add_nature_stats("Careful", Stats.SPDEFENSE, Stats.SPATTACK);
array[Natures.QUIRKY]=add_nature_stats("Quirky");

return array;
