module main

import rand

const (
	deep_water_height = f32(0.4)
	shallow_water_height = f32(0.5)
	sand_height = f32(0.6)
	grass_height = f32(0.7)
	forest_height = f32(0.8)
	rock_height = f32(0.9)
	snow_height = f32(1)
)


// height_a < height_b
fn height_map_fusion (height_a [][]f32, height_b [][]f32, coeff_a int, coeff_b int) [][]f32 {
	size_a := [height_a.len, height_a[0].len]
	size_b := [height_b.len, height_b[0].len]
	ratio_y := size_a[0]/size_b[0]
	ratio_x := size_a[1]/size_b[1]
	
	mut height_c := [][]f32{}
	for y in 0..size_a[0] {
		height_c << []f32{}
		for x in 0..size_a[1] {
			height_c[y] << (height_a[y][x] * coeff_a + height_b[int(y/ratio_y)][int(x/ratio_x)] * coeff_b) / (coeff_a + coeff_b)
		}
	}
	return height_c
}

fn generate_map (width int, height int) [][]Cell {

	height_map := perlin_array(width, height)

	mut cell_map := [][]Cell{}
	for y in 0..height {
		cell_map << []Cell{}
		for x in 0..width {
			cell_map[y] << Cell{}
			if height_map[y][x] > snow_height {
				cell_map[y][x] = new_cell("snow")
			} else if height_map[y][x] > rock_height {
				cell_map[y][x] = new_cell("rock")
			} else if height_map[y][x] > forest_height {
				cell_map[y][x] = new_cell("forest")
			} else if height_map[y][x] > grass_height {
				cell_map[y][x] = new_cell("grass")
			} else if height_map[y][x] > sand_height {
				cell_map[y][x] = new_cell("sand")
			} else if height_map[y][x] > shallow_water_height {
				cell_map[y][x] = new_cell("shallow_water")
			} else {
				cell_map[y][x] = new_cell("deep_water")
			}
		}
	}

	return cell_map
}
