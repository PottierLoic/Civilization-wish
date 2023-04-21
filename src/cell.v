module main

struct Cell {
	biome      Biome
mut:
	ressources []string
	town       &Town = unsafe { nil }
	entity	   &Entity = unsafe { nil }
}

fn (mut c Cell) add_ressource(ressource string, amount int) {
	for _ in 0..amount { c.ressources << ressource }
}

fn (mut c Cell) add_town(town &Town) {
	unsafe { c.town = town }
}

fn new_cell(biome string) Cell {
	return Cell{
		biome: new_biome(biome)
	}
}
