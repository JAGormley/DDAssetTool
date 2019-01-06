// Gem Collector HUD

/// PLAYER FLAG ///
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

