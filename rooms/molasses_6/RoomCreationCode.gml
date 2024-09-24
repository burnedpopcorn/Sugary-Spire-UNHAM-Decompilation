if (global.lvldesign == 1)
{
    if global.panicking
    {
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_7")), ts_molasses1escapeNEW)
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_4")), ts_molasses1escapeNEW)
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_3")), ts_molasses1escapeNEW)
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_2")), ts_molasses1escapeNEW)
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_1")), ts_molasses1escapeNEW)
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_bg")), ts_molasses1escapeNEW)
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_Secret")), ts_molasses1escapeNEW)
    }
    else
    {
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_7")), ts_molasses1NEW)
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_4")), ts_molasses1NEW)
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_3")), ts_molasses1NEW)
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_2")), ts_molasses1NEW)
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_1")), ts_molasses1NEW)
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_bg")), ts_molasses1NEW)
        tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_Secret")), ts_molasses1NEW)
    }
    layer_destroy(layer_get_id("Backgrounds_1"))
    if (!global.panicking)
        layer_destroy(layer_get_id("Effect_1"))
}
else
{
    layer_destroy(layer_get_id("Backgrounds_foreground2"))
    layer_destroy(layer_get_id("Effect_1"))
}
