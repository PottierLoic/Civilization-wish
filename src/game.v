module main

import math

struct Game {
mut:
	world   World
	players []Player
}

fn (mut g Game) update_visibility_grids() {
	for mut p in g.players {
		mut possesed := [][]int{}
		// find all cells "possesed" by player
		for y in 0..g.world.grid.len {
			possesed << []int{}
			for x in 0..g.world.grid[y].len {
				if g.world.grid[y][x].town != unsafe { nil } {
					if g.world.grid[y][x].town.civilization.name == p.civilization.name {
						possesed[y] << [x, y]
					}
				} else if g.world.grid[y][x].entity != unsafe { nil } {
					if g.world.grid[y][x].entity.civilization.name == p.civilization.name {
						possesed[y] << [x, y]
					}
				}
			}
		}

		for pos in possesed {
			for xx in -3..4 {
				for yy in -3..4 {
					if math.abs(xx + yy) > 3 { continue }
					if pos[0] + xx < 0 || pos[0] + xx > g.world.grid.len - 1 { continue }
					if pos[1] + yy < 0 || pos[1] + yy > g.world.grid.len - 1 { continue }
					p.visibility_grid[pos[1]][pos[0]] = true
				}
			}
		}		
	}
}

fn new_game() Game {
	return Game{
		world: new_world(300, 300)
		players: [new_player("loic", new_civilization("france"))]	
	}
}