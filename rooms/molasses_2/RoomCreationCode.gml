if (global.lvldesign == 1)
{
    if (global.panic)
    {
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_fg")), ts_molasses1escapeNEW);
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_3")), ts_molasses1escapeNEW);
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_2")), ts_molasses1escapeNEW);
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_1")), ts_molasses1escapeNEW);
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_bg")), ts_molasses1escapeNEW);
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_bg2")), ts_molasses1escapeNEW);
    }
    else
    {
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_fg")), ts_molasses1NEW);
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_3")), ts_molasses1NEW);
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_2")), ts_molasses1NEW);
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_1")), ts_molasses1NEW);
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_bg")), ts_molasses1NEW);
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_bg2")), ts_molasses1NEW);
    }
    
    layer_destroy(layer_get_id("Backgrounds_1"));
    layer_destroy(layer_get_id("Backgrounds_Ground1"));
    layer_background_vtiled(layer_background_get_id(layer_get_id("Backgrounds_Ground2")), 1);
    
    if (!global.panic)
        layer_destroy(layer_get_id("Effect_1"));
}
else
{
    layer_destroy(layer_get_id("Backgrounds_foreground2"));
    layer_destroy(layer_get_id("Effect_1"));
    layer_destroy(layer_get_id("Backgrounds_H1"));
    layer_destroy(layer_get_id("Backgrounds_H2"));
}
