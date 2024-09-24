if (global.lvldesign == 1)
{
    tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_2")), ts_steamNEW)
    tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_1")), ts_steamNEW)
    tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_3")), ts_steamNEW)
    tilemap_tileset(layer_tilemap_get_id(layer_get_id("Tiles_4")), ts_steamNEW)
    layer_destroy(layer_get_id("Backgrounds_still"))
}
