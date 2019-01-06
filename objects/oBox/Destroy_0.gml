if irandom_range(1, 100) <= global.gemDropRate instance_create_layer(x, y, layer, objGem)
if irandom_range(1, 100) <= global.heartDropRate instance_create_layer(x, y, layer, oHeartPiece)
if irandom_range(1, 100) <= global.powDropRate instance_create_layer(x, y, layer, oEnergy)
var boxXCell = x/TILE_SIZE
var boxYCell = y/TILE_SIZE
var collisionMap = getCollideMap()
with oGameController {
	// @TODO: refactor into "cellIsInLane"; prevents allowing boxes to spawn in lanes
	if boxYCell != 1 && boxYCell != 7 && boxYCell != 13 && 
		boxXCell != 2 && boxXCell != 14 && boxXCell != 15 && boxXCell != 27 {
		mp_grid_clear_cell(NoBoxGrid, boxXCell, boxYCell)
		mp_grid_clear_cell(ObstacleGrid, boxXCell, boxYCell)
	}
}
// groundEdge here is dumb but it'll work for now
tilemap_set(collisionMap, 0, boxXCell, boxYCell)
instance_create_layer(x, y, "Interact", oBoxDest)
if object_index != oPickupCover audio_play_sound(soBoxBreak, 1, false) // @TODO: this is dumb