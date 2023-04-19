module main

import gg

struct App {
mut:
	gg     &gg.Context = unsafe { nil }
	iidx   int
	pixels &u32 = unsafe { vcalloc(screen_width * screen_height * sizeof(u32)) }
	game   Game = new_game()
	x      int
	y      int
}

fn (mut app App) display() {
	app.pixels = unsafe { vcalloc(screen_width * screen_height * sizeof(u32)) }
	w := app.game.world

	// to only check lines that could be visible
	min_x := (app.x - screen_width) / cell_size
	max_x := (app.x + screen_width) / cell_size
	min_y := (app.y - screen_height) / cell_size
	max_y := (app.y + screen_height) / cell_size

	for y in 0 .. w.height {
		if y > max_y || y < min_y {
			continue
		}
		for x in 0 .. w.width {
			if x > max_x || x < min_x {
				continue
			}
			for xx in 0 .. cell_size {
				for yy in 0 .. cell_size {
					if y * cell_size + yy < app.y - screen_height / 2
						|| y * cell_size + yy > app.y + screen_height / 2
						|| x * cell_size + xx < app.x - screen_width / 2
						|| x * cell_size + xx > app.x + screen_width / 2 {
						continue
					}
					unsafe {
						match w.grid[y][x].biome.name {
							'sand' { app.pixels[x * cell_size + xx - app.x + screen_width / 2 +	(y * cell_size + yy - app.y + screen_height / 2) * screen_width] = u32(sand_texture[yy][xx].abgr8()) }
							'grass' { app.pixels[x * cell_size + xx - app.x + screen_width / 2 + (y * cell_size + yy - app.y + screen_height / 2) * screen_width] = u32(grass_texture[yy][xx].abgr8()) }
							'deep_water' { app.pixels[x * cell_size + xx - app.x + screen_width / 2 + (y * cell_size + yy - app.y +	screen_height / 2) * screen_width] = u32(deep_water_texture[yy][xx].abgr8()) }
							'shallow_water' { app.pixels[x * cell_size + xx - app.x + screen_width / 2 + (y * cell_size + yy - app.y + screen_height / 2) * screen_width] = u32(shallow_water_texture[yy][xx].abgr8()) }
							'rock' { app.pixels[x * cell_size + xx - app.x + screen_width / 2 + (y * cell_size + yy - app.y + screen_height / 2) * screen_width] = u32(rock_texture[yy][xx].abgr8()) }
							else { continue }
						}
					}
				}
			}
		}
	}

	// screen display
	mut istream_image := app.gg.get_cached_image_by_idx(app.iidx)
	istream_image.update_pixel_data(app.pixels)
	size := gg.window_size()
	app.gg.draw_image(0, 0, size.width, size.height, istream_image)
}

fn graphics_init(mut app App) {
	app.iidx = app.gg.new_streaming_image(screen_width, screen_height, 4, pixel_format: .rgba8)
}

fn frame(mut app App) {
	app.gg.begin()
	app.display()
	app.gg.end()
}

fn keydown(code gg.KeyCode, mod gg.Modifier, mut app App) {
	if code == gg.KeyCode.escape {
		app.gg.quit()
	} else if code == gg.KeyCode.enter {
		app.game = new_game()
		println('new_game')
	} else if code == gg.KeyCode.left {
		app.x -= 10
	} else if code == gg.KeyCode.right {
		app.x += 10
	} else if code == gg.KeyCode.up {
		app.y -= 10
	} else if code == gg.KeyCode.down {
		app.y += 10
	}
	if app.x < screen_width / 2 {
		app.x = screen_width / 2
	} else if app.x > app.game.world.width * cell_size - screen_width / 2 {
		app.x = app.game.world.width * cell_size - screen_width / 2
	}
	if app.y < screen_height / 2 {
		app.y = screen_height / 2
	} else if app.y > app.game.world.height * cell_size - screen_height / 2 {
		app.y = app.game.world.height * cell_size - screen_height / 2
	}
}

fn main() {
	mut app := App{
		gg: 0
	}
	app.gg = gg.new_context(
		bg_color: bg_color
		frame_fn: frame
		init_fn: graphics_init
		user_data: &app
		width: screen_width
		height: screen_height
		create_window: true
		keydown_fn: keydown
		window_title: 'Civilization wishhh'
	)

	app.gg.run()
}
