/// void scribble_add_flag(name, index);
/// Defines a flag name, allowing for behaviours to be set per-character when calling scribble_create()
///
/// @param name    Event name, as a string
/// @param index   Integer flag index, from 0 to SCRIBBLE_MAX_FLAGS-1 inclusive

var _name  = argument0;
var _index = argument1;

if ( global.__scribble_init_complete == SCRIBBLE_INIT_START ) {
    show_error( "scribble_add_custom_flag_name() should be called after initialising Scribble.", false );
    exit;
}

if ( !is_string(_name) ) {
    show_error( "Custom flag names should be strings.", false );
    exit;
}

if ( !is_real(_index) || (_index != floor(_index)) || (_index < 0) || (_index > (SCRIBBLE_MAX_FLAGS-1)) ) {
    show_error( "Custom flag indexes should be an integer from 0 to " + string(SCRIBBLE_MAX_FLAGS-1) + " (inclusive).To increase the maximum number of flags, see __scribble_config() (Index was " + string(_index), false );
    exit;
}

var _old_name = global.__scribble_flags[? _index ];
if ( _old_name != undefined ) {
    show_debug_message( "Scribble: WARNING! Overwriting flag index " + string( _index ) + " " + _old_name );
    ds_map_delete( global.__scribble_flags, _old_name );
}

//Bidrectional lookup in the same map made possible because the datatypes are different
global.__scribble_flags[? _index ] = _name;
global.__scribble_flags[? _name  ] = _index;

debug_silent( "Scribble: Added flag name " + _name + " as index " + string(_index) );

