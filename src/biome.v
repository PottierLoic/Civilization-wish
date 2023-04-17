module main

import gg

struct Biome {
	name string
	attraction int
	color gg.Color
}

fn new_biome(name string, attraction int) Biome {
	if name == "desert" {
		return Biome{
			name: name
			attraction: attraction
			color: desert_color
		}
	} else if name == "forest" {
		return Biome{
			name: name
			attraction: attraction
			color: forest_color
		}
	}
	return Biome{
		name: name
		attraction: attraction
		color: bg_color
	}
}