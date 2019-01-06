// Survivor HUD

var startY = y + 4
var iconColx = x + 1
var iconStartHeight = startY + 40
var heartCol1x = x + 1
var heartCol2x = x + 9
var gemColx = x + 18

if !surface_exists(LineSurf) {
	LineSurf = surface_create(480, 270)
	draw_set_color(make_color_rgb(1, 255, 0))
	surface_set_target(LineSurf)
	draw_clear_alpha(c_white, 0)
	draw_rectangle(x+0, y+0, x+28, y+1, true)
	surface_reset_target()
	draw_set_color(c_white)
}

if PaletteShader != noone {
	shader_set(shPaletteSwap)
	texture_set_stage(PaletteShader.PaletteSwapSampler, PaletteShader.TexturePalette)
	shader_set_uniform_f(PaletteShader.vOffset, PaletteShader.vNormal)
	draw_surface(LineSurf, 0, 0)
	shader_reset()
}

var drawPiece = Player.HeartPieces > 0 ? 1 : 0

shader_set(shPaletteSwap)
texture_set_stage(PaletteShader.PaletteSwapSampler, PaletteShader.TexturePalette)
shader_set_uniform_f(PaletteShader.vOffset, PaletteShader.vNormal)
for (var i = 0; i < Player.Lives + drawPiece; i++) {
	var spaceMod = floor(i/(global.totalLives/2))
	if i < Player.Lives draw_sprite(spLife, 0, heartCol1x + spaceMod*8, startY + i*8 - (spaceMod * 40))
	if Player.Lives < global.totalLives && Player.HeartPieces > 0 && i == Player.Lives {
		var spHeight = sprite_get_height(spLife)
		var spWidth = sprite_get_height(spLife)
		switch Player.HeartPieces {
			case 1:
				draw_sprite_part(spLife, 0, 0, spHeight/2-2, spWidth/2+1, spHeight, heartCol1x + spaceMod*8, startY + i*8 - (spaceMod * 40)+ spHeight/2-2) 
				break
			case 2:
				draw_sprite_part(spLife, 0, 0, 0, spWidth/2+1, spHeight, heartCol1x + spaceMod*8, startY + i*8 - (spaceMod * 40)) 
				break
			case 3:
				draw_sprite_part(spLife, 0, 0, 0, spWidth/2+1, spHeight, heartCol1x + spaceMod*8, startY + i*8 - (spaceMod * 40)) 
				draw_sprite_part(spLife, 0, spWidth/2-1, spHeight/2-1, spWidth/2, spHeight, heartCol1x + spaceMod*8 + spWidth/2, startY + i*8 - (spaceMod * 40)+ spHeight/2-1) 
				break
		}
	}
}
shader_reset()

for (var j = 0; j < global.gemsPerLevel; j++) {
	var gemSprite = Player.Points > j ? spHUDGem : spHUDGemGrey
	var spAlpha = Player.Points > j ? 1 : .7
	draw_sprite_ext(gemSprite, 0, gemColx, startY + j*14, 1, 1, 0, c_white, spAlpha)
}

var litIcons = ds_list_create()
for (var k = 0; k < ds_list_size(Player.EarnedAbilities); k++) {
	var maybeIcon = ds_map_find_value(global.AbilitiesToIcons, Player.EarnedAbilities[|k])
	if !is_undefined(maybeIcon) ds_list_add(litIcons, maybeIcon)
}

for (var l = 0; l < ds_list_size(Icons); l++) {
	var alph = ds_list_find_index(litIcons, Icons[|l]) != -1 ? 1 : .5
	draw_sprite_ext(Icons[|l], 0, iconColx-1, iconStartHeight + l*26, 1, 1, 0, c_white, alph)
	
	// @TODO: if more consumables, extract into an object -- ITS BAD
	if Icons[|l] == spIcFlashBang && alph == 1 {
		draw_set_color(make_color_rgb(248, 148, 29))
		var fbNum = instance_exists(Player.CharInstance) ? Player.CharInstance.FlashbangNum : global.flashbangNum
		for (var m = 0; m < fbNum; m++) {
			draw_rectangle(iconColx-3, iconStartHeight + l*26 + m*8, iconColx-3 + 4, iconStartHeight + l*26 + 4+ m*8, false)
		}
		draw_set_color(c_white)
	}
}

ds_list_destroy(litIcons)
