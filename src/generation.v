module main

import rand

const (
	deep_water_height = f32(0.2)
	shallow_water_height = f32(0.4)
	sand_height = f32(0.5)
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
	rand.seed([rand.u32(), rand.u32()])
	mut height_map1 := perlin(width, height)
	mut height_map2 := perlin(int(width/5), int(height/5))
	mut height_map_tot := height_map_fusion(height_map1, height_map2, 1, 2)


	mut cell_map := [][]Cell{}
	for y in 0..height {
		cell_map << []Cell{}
		for x in 0..width {
			cell_map[y] << Cell{}
			if height_map_tot[y][x] > snow_height {
				cell_map[y][x] = new_cell("snow")
			} else if height_map_tot[y][x] > rock_height {
				cell_map[y][x] = new_cell("rock")
			} else if height_map_tot[y][x] > forest_height {
				cell_map[y][x] = new_cell("forest")
			} else if height_map_tot[y][x] > grass_height {
				cell_map[y][x] = new_cell("grass")
			} else if height_map_tot[y][x] > sand_height {
				cell_map[y][x] = new_cell("sand")
			} else if height_map_tot[y][x] > shallow_water_height {
				cell_map[y][x] = new_cell("shallow_water")
			} else {
				cell_map[y][x] = new_cell("deep_water")
			}
		}
	}
	print("ça génère nickel")

	return cell_map
}
