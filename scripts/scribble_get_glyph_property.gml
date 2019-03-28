/// something scribble_get_glyph_property(fontName, character, property);
/// Returns a property value for a character in a font previously added to Scribble
///
/// Three properties are available:
/// 1) SCRIBBLE_GLYPH_X_OFFSET   - The relative x-position to display the glyph
/// 2) SCRIBBLE_GLYPH_Y_OFFSET   - The relative y-position to display the glyph
/// 3) SCRIBBLE_GLYPH_SEPARATION - The effective width of the glyph
///
/// @param fontName    The font name (as a string) of the font
/// @param character   The character (as a string)
/// @param property    The property to return. See description for more details
///
/// All optional arguments accept <undefined> to indicate that the default value should be used.

var _font      = argument0;
var _character = argument1;
var _property  = argument2;

if ( global.__scribble_init_complete == SCRIBBLE_INIT_START ) {
    show_error( "scribble_get_glyph_property() should be called after initialising Scribble.\n ", false );
    exit;
}

if ( global.__scribble_init_complete == SCRIBBLE_INIT_DURING ) {
    show_error( "scribble_get_glyph_property() should be called after initialising Scribble.\n ", false );
    exit;
}

var _font_data = global.__scribble_font_data[? _font ];

var _array = _font_data[ __E_SCRIBBLE_FONT.GLYPHS_ARRAY ];
if ( _array == undefined ) {
    //If the glyph array doesn't exist for this font, use the ds_map fallback
    var _map = _font_data[ __E_SCRIBBLE_FONT.GLYPHS_MAP ];
    var _glyph_data = _map[? _character ];
} else {
    var _glyph_data = _array[ ord(_character) - _font_data[ __E_SCRIBBLE_FONT.GLYPH_MIN ] ];
}

if ( _glyph_data == undefined ) {
    show_error( "Character " + _character + " not found for font " + _font, false );
    return undefined;
}

return _glyph_data[ _property ];

