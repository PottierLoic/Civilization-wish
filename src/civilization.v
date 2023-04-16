module main

struct Civilization {
	name string
	leader string
	year int
}

fn new_civilization(name string) Civilization {
	// need to do 'if name == "Rome" { return Civilization{...} etc..}'
	return Civilization{
		name: name
		}
}