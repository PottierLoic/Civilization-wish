module main

import rand
import math

const (
	deep_water_height = f32(0.2)
	shallow_water_height = f32(0.4)
	sand_height = f32(0.5)
	grass_height = f32(0.7)
	forest_height = f32(0.8)
	rock_height = f32(0.9)
	snow_height = f32(1)
)

fn generate_height_map (width int, height int) [][]f32 {
	rand.seed([u32(114764230), 293925637])
	mut height_map := perlin(width, height)


	return height_map
}

fn main() {
	test := generate_height_map(10, 10)
	println(test)
}
