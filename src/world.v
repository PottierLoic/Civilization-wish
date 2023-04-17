module main

struct World {
	mut:
		grid [][]Cell
		turn int
}

fn new_world() World {
	mut w := World{}
	w.grid = [][]Cell{}
	return w
}