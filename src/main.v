module main

import gg
import gx

struct App {
	mut:
		gg &gg.Context = unsafe { nil }
		iidx int
		pixels &u32 = unsafe { vcalloc(screen_width * screen_height * sizeof(u32)) }
		game Game = new_game()
}

fn (mut app App) display() {
	w := app.game.world

	for y in 0..w.height {
		for x in 0..w.width {
			for xx in 0..cell_size {
				for yy in 0..cell_size {
					if (y * cell_size + yy) * screen_width + x * cell_size + xx > screen_width * screen_height { continue }
					unsafe { app.pixels[x * cell_size + xx + (y * cell_size + yy) * screen_width] = u32(w.grid[y][x].biome.color.abgr8())}
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
		println("new_game")
	}
}

fn main() {
	mut app := App {
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