module main

import rand
import math


const (
	grad = [[1, 1], [-1, 1], [1, -1], [-1, -1], [1, 0], [-1, 0], [0, 1], [0, -1]]
)

// linear interpolation between a0 and a1
// weight is in range [0, 1]
fn interpolate(a0 f32, a1 f32, weight f32) f32 {
	return (a1 - a0) * weight + a0
}

struct Vector2 {
	x f32
	y f32
}

fn random_gradient(ix int, iy int) Vector2 {
	rd := rand.f32_in_range(0, 2 * math.pi) or { 0 }
	return Vector2{
		x: f32(math.cos(rd))
		y: f32(math.sin(rd))
	}

}

fn dot_product(ix int, iy int, x f32, y f32) f32 {
	gradient := random_gradient(ix, iy)

	dx := x - f32(ix)
	dy := y - f32(iy) 

	return gradient.x * dx + gradient.y * dy
}

fn smoothstep(x f32) f32 {
	return x * x * x * (x * (x * 6 - 15) + 10)
}

fn perlin(x f32, y f32) f32 {
	x0 := int(x)
	x1 := x0 + 1
	y0 := int(y)
	y1 := y0 + 1

	sx := x - f32(x0)
	sy := y - f32(y0)

	n0 := dot_product(x0, y0, x, y)
	n1 := dot_product(x1, y0, x, y)
	ix0 := interpolate(n0, n1, sx)

	n00 := dot_product(x0, y1, x, y)
	n11 := dot_product(x1, y1, x, y)
	ix1 := interpolate(n00, n11, sx)

	value := interpolate(ix0, ix1, sy)

	return (value + 1) / 2
}

fn perlin_array(width int, height int) [][]f32 {
	mut arr := [][]f32{}
	for y := 0; y < height; y++ {
		arr << []f32{}
		yy := (f32(y)/height)*10
		for x := 0; x < width; x++ {
			xx := (f32(x)/width)*10
			arr[y] << perlin(f32(xx), f32(yy))
		}
	}
	return arr
}
