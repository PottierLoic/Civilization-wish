module main

struct Entity {
	name          string
mut:	
	x			  int
	y			  int
	health        int
	max_movements int
	movement      int
	faith         int
	damage        int
}

fn new_entity(name string) Entity {
	return Entity{
		name: name
	}
}
