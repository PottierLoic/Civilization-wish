module main

struct Wonder {
	name string
}

fn new_wonder(name string) Wonder {
	return Wonder{
		name: name
	}
}