module main

struct Town {
	name string
	mut:
		population int
		food int
		production int
}

fn new_town(name string) Town {
	return Town{
		name: name
	}
}