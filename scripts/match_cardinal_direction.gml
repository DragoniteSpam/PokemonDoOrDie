/// @description  double match_cardinal_direction(angle, magnitude, dir);

if (abs(argument1)<0.2){
    return false;
}

return ((argument0+360)>(argument2+315)&&(argument0+360)<=(argument2+405));
