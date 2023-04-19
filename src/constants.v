module main

import gx

const (
	// Dimensions
	screen_width  = 800
	screen_height = 800
	cell_size     = 40

	// Colors
	bg_color      = gx.black

	// Probabilities
	iron_spawn_chance = 0.01
	fish_spawn_chance = 0.5
	weath_spawn_chance = 0.8

	// World generation heights
	deep_water_height    = f32(0.2)
	shallow_water_height = f32(0.4)
	sand_height          = f32(0.5)
	grass_height         = f32(0.6)
	forest_height        = f32(0.8)
	rock_height          = f32(0.95)
	snow_height          = f32(1)
)
