module main

struct Biome {
	name       string
	attraction int
}

fn new_biome(name string) Biome {
	if name == 'sand' {
		return Biome{
			name: name
			attraction: 1
		}
	} else if name == 'deep_water' {
		return Biome{
			name: name
			attraction: 1
		}
	} else if name == 'shallow_water' {
		return Biome{
			name: name
			attraction: 1
		}
	} else if name == 'grass' {
		return Biome{
			name: name
			attraction: 2
		}
	} else if name == 'rock' {
		return Biome{
			name: name
			attraction: 2
		}
	}
	panic('type de case inconnu')
}
