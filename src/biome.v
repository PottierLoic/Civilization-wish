module main

import gg

struct Biome {
	name string
	attraction int
	color gg.Color
}

fn new_biome(name string) Biome {
	if name == "sand" {
		return Biome{
			name: name
			attraction: 1
			color: sand_color
		}
	} else if name == "forest" {
		return Biome{
			name: name
			attraction: 2
			color: forest_color
		}
	} else if name == "deep_water" {
		return Biome{
			name: name
			attraction: 1
			color: deep_water_color
		}
	} else if name == "shallow_water" {
		return Biome{
			name: name
			attraction: 1
			color: shallow_water_color
		}
	} else if name == "grass" {
		return Biome{
			name: name
			attraction: 2
			color: grass_color
		}
	} else if name == "rock" {
		return Biome{
			name: name
			attraction: 2
			color: rock_color
		}
	} else if name == "snow" {
		return Biome{
			name: name
			attraction: 3
			color: snow_color
		}
	}
	return Biome{
		name: name
		attraction: 0
		color: bg_color
	}
}