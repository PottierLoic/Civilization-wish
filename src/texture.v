module main

import gx
import rand

const (
	grass_rgb = [gx.rgb(65, 152, 10), gx.rgb(38, 139, 7), gx.rgb(17, 124, 19), gx.rgb(19, 109, 21), gx.rgb(19, 133, 16)]
	sand_rgb = [gx.rgb(242, 210, 169), gx.rgb(236, 204, 162), gx.rgb(225, 191, 146), gx.rgb(246, 215, 176)]
	deep_water_rgb = [gx.rgb(0, 64, 128), gx.rgb(0, 51, 102), gx.rgb(0, 64, 128)]
	shallow_water_rgb = [gx.rgb(0, 89, 179), gx.rgb(0, 64, 128), gx.rgb(0, 102, 204)]
	rock_rgb = [gx.rgb(158, 152, 134), gx.rgb(196, 188, 167), gx.rgb(183, 176, 156)]

	grass_texture         = generate_texture(grass_rgb)
	sand_texture          = generate_texture(sand_rgb)
	deep_water_texture    = generate_texture(deep_water_rgb)
	shallow_water_texture = generate_texture(shallow_water_rgb)
	rock_texture          = generate_texture(rock_rgb)
	
	france_town_texture		  = generate_town_texture('france')
	rome_town_texture 	  = generate_town_texture('rome')

)

fn generate_texture(rgb_codes []gx.Color) [][]gx.Color {
	mut texture := [][]gx.Color{}
	for i in 0 .. cell_size {
		texture << []gx.Color{}
		for _ in 0 .. cell_size {
			texture[i] << rand.element(rgb_codes) or { rgb_codes[0] }
		}
	}
	return texture
}

fn generate_town_texture(civilization string) [][]gx.Color {
	mut texture := [][]gx.Color{}
	for i in 0 .. cell_size {
		texture << []gx.Color{}
		for y in 0 .. cell_size {
			if i == 0 || i == cell_size - 1 || y == 0 || y == cell_size - 1 {
				texture[i] << gx.black
			} else {
				texture[i] << match civilization {
					'rome' { gx.yellow }
					'france' { gx.blue }
					else { gx.white }
				}
			}
		}
	}
	return texture
}
