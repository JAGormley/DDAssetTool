///@params stageType

var stageType = argument0

// set walls on wall tiles
// floors on non-tiles
// appropriate external on outside tiles

var collideLayer = getCollideMap()

var stageResources = ds_map_find_value(global.StageTypeToResources, stageType)
var wall = ds_map_find_value(stageResources, stageResTypes.wall)
var wallCol = ds_map_find_value(stageResources, stageResTypes.wallSmokeCollider)
var floorType = ds_map_find_value(stageResources, stageResTypes.floorType)
var outside = ds_map_find_value(stageResources, stageResTypes.outside)
var box = ds_map_find_value(stageResources, stageResTypes.box)
var bedrock = ds_map_find_value(stageResources, stageResTypes.bedrock)
var hazard = ds_map_find_value(stageResources, stageResTypes.hazard)

var vCellNum = room_height/TILE_SIZE
var hCellNum = room_width/TILE_SIZE
var boxesColSurf = surface_create(480, 270) // @TODO: BUG! Thiis can crap out sometimes when loading before the sprite is craeted

var floorLayer = layer_tilemap_get_id("FloorTiles")
tilemap_tileset(floorLayer, floorType)

surface_set_target(boxesColSurf)
for (var i = 0; i < vCellNum; i++) {
	var currentVPixel = i * TILE_SIZE
	for (var j = 0; j < hCellNum; j++) {
		var currentHPixel = j * TILE_SIZE
		var tileIndex = tilemap_get_at_pixel(collideLayer, currentHPixel, currentVPixel)
		var tileEmpty = tile_get_empty(tileIndex)
		if tileIndex == collisionTileTypes.wall {
			instance_create_layer(currentHPixel, currentVPixel, "Walls", wall)
			draw_sprite(wallCol, 0, currentHPixel, currentVPixel)
			tilemap_set(floorLayer, irandom_range(1, 3), j, i)
		}
		else if tileIndex == collisionTileTypes.box {
			instance_create_layer(currentHPixel + 8, currentVPixel + 8, "Interact", box)
			tilemap_set(floorLayer, irandom_range(1, 3), j, i)
		}
		else if tileIndex == collisionTileTypes.outside
			tilemap_set(collideLayer, outside, j, i)
		else if tileEmpty {
			var floorTileNum = 4
			if stageType == stageTypes.badlands
				floorTileNum = 6
			tilemap_set(floorLayer, irandom_range(1, floorTileNum), j, i)
		}
	}
}
surface_reset_target()
global.boxesColSprite = sprite_create_from_surface(boxesColSurf, 0, 0, 480, 270, true, false, 0, 0)

var thing = layer_background_get_id(layer_get_id("Bedrock"))

layer_background_sprite(
	layer_background_get_id(layer_get_id("Bedrock")),
	bedrock
)

var bedrockLayerDepth = layer_get_depth(layer_get_id("Bedrock"))
// Stage-specific actions
// @TODO: move this code into stage specific hydration scripts
switch stageType {
	case stageTypes.space:
		//instance_create_layer(0, 0, "Controllers", oBeamController)
		instance_create_layer(0, 0, "StageProps", oFrameSpace)
		BGFar = layer_create(bedrockLayerDepth-1)
		BGMid = layer_create(bedrockLayerDepth-2)
		BGNear = layer_create(bedrockLayerDepth-3)
		layer_background_htiled(layer_background_create(BGFar, spSpaceBgFar), true)
		layer_background_htiled(layer_background_create(BGMid, spSpaceBgMid), true)
		layer_background_htiled(layer_background_create(BGNear, spSpaceBgNear), true)
		layer_hspeed(BGFar, .02)
		layer_hspeed(BGMid, -.05)
		layer_hspeed(BGNear, .1)
		break
	case stageTypes.eden:
		instance_create_layer(0, 0, "StageProps", oFrameEden)
		break
	case stageTypes.vr:
		instance_create_layer(0, 0, "StageProps", oFrameVR)
		break
	case stageTypes.badlands:
		instance_create_layer(0, 0, "StageProps", oFrameBadlands)
		break
	case stageTypes.test:
		instance_create_layer(0, 0, "StageProps", oFrameTest)
		break
}
	

layer_set_visible(layer_get_id("CollisionTiles"), false)