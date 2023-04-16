module main

struct Player {
	mut:
		// player info
		name string
		civilization Civilization

		// resources
		gold int
		science int
		faith int
		culture int

		// places
		towns []Town

		// wonders
		wonders []Wonder

		// entities
		entities []Entity

}

fn new_player(name string, civilization string) Player {
	mut p := Player{}
	p.name = name
	p.civilization = new_civilization(civilization)
	return p
}