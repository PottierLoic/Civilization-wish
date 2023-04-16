module main

struct World {
	mut:
		grid [][]Cell
		entities []Entity
		turn int
}

fn new_world() World {
	mut w := World{}
	w.grid = [][]Cell{}
	w.entities = []Entity{}
	w.turn = 0
	return w
}