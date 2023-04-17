module main

struct Game {
	mut:
		world World
		players Player
}

fn new_game() Game {
	return Game {
		world: new_world(50, 50)
	}
}