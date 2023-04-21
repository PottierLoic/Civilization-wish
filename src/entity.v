module main

struct Entity {
	name          string
mut:	
	civilization Civilization
	x			  int
	y			  int
	health        int
	max_movements int
	movement      int
	faith         int
	damage        int
}

fn new_entity(name string, civilization Civilization) Entity {
	return Entity{
		name: name
		civilization: civilization
	}
}
