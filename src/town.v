module main

struct Town {
	name string
mut:
	civilization Civilization
	population int = 1
	food       int
	production int = 1
	wonders    []Wonder
}

fn new_town(civilization Civilization, name string) &Town {
	return &Town{
		civilization: civilization
		name: name
	}
}
