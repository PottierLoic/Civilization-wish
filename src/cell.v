module main


struct Cell {
	biome Biome
	attraction int
}

fn new_cell() Cell {
	return Cell{
		biome: new_biome(),
		attraction: 1
	}
}