module main

struct Civilization {
	name string
	leader string
	description string
}

fn new_civilization(name string) Civilization {
	// need to do 'if name == "Rome" { return Civilization{...} etc..}'
	// Or follow the same pattern as i did in wonder struct
	// probably going to do that.
	return Civilization{
		name: name
		}
}