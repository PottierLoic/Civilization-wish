module main

struct Player {
	// player info
	name         string
	civilization Civilization
mut:
	// resources
	gold    int
	science int
	faith   int
	culture int

	// places
	towns []&Town

	// entities
	entities []Entity

	// visibility
	visibility_grid [][]bool
}

fn new_player(name string, civilization Civilization) Player {
	return Player{
		name: name
		civilization: civilization
	}
}
