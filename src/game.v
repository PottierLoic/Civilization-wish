module main

struct Game {
mut:
	world   World
	players []Player
}

fn new_game() Game {
	return Game{
		world: new_world(300, 300)
		players: [new_player("Loic", new_civilization("france"))]	
	}
}