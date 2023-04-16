module main

struct Entity {
	name string
	health int
	max_movements int
	movement int
	faith int
	damage int
}

fn new_entity(name string) Entity {
	return Entity {
		name: name
	}
}