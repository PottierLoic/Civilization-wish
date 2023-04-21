module main

import gx

const (
	// Dimensions
	screen_width  = 400
	screen_height = 400
	cell_size     = 40

	// Colors
	bg_color      = gx.black

	// Probabilities
	


	// -------- WORLD GENERATION --------
	
	// Heightmap levels.
	deep_water_height    = f32(0.2)
	shallow_water_height = f32(0.5)
	sand_height          = f32(0.55)
	grass_height         = f32(0.6)
	forest_height        = f32(0.8)
	rock_height          = f32(0.95)
	snow_height          = f32(1)

	// Ressources spawn chances.
	iron_spawn_chance = 0.01
	fish_spawn_chance = 0.05
	wheath_spawn_chance = 0.2

)
