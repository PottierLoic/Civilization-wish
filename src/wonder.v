module main

struct Wonder {
	// Texts
	name        string
	description string
	effect      string
	// Real effects
	production_boost int
	science_boost    int
	faith_boost      int
	gold_boost       int
	growth_boost     int
}

const (
	primal_wonders = {
		'pyramid': Wonder{
			name: 'Great Pyramid of Giza'
			description: 'The great pyramid of Giza is the largest Egyptian pyramid'
			effect: 'Grant 10% increased production to all your towns'
			production_boost: 10
		}
	}
)
