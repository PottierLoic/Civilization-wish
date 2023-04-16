module main

import gg
import gx

struct App {
	mut:
		gg &gg.Context = unsafe { nil }
		iidx int
		pixels &u32 = unsafe { vcalloc(screen_width * screen_height * sizeof(u32)) }
}

fn (mut app App) display() {
	// display here

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
		window_title: 'Civilization wishhh'
	)
	app.gg.run()
}