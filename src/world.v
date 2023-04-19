module main

struct World {
	height int
	width  int
mut:
	grid [][]Cell
	turn int
}

fn new_world(width int, height int) World {
	mut w := World{
		width: width
		height: height
	}

	w.grid = generate_map(width, height)

	return w
}
