debug("remember to define natures at some point");

enum Natures {
    DEFAULT,
}

var array=array_create(Natures.DEFAULT);

array[Natures.DEFAULT]=add_nature("Default Nature", 1, 1, 1, 1, 1, 1);

return array;
