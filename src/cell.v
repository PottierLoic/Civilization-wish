module main


struct Cell {
	biome Biome
	entity Entity
	// need to add something like (town Town) that isn't filled 
	// but don't know how to do that because there can be other builds
	// than a town and a town is multiple cells
}

fn new_cell(biome string) Cell {
	return Cell{
		biome: new_biome(biome),
	}
}