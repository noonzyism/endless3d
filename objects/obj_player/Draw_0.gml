if (obj_player.shooting) {
	draw_set_color(c_yellow);
	draw_line(obj_player.x, obj_player.y, mouse_x + random_range(-10, 10), mouse_y + random_range(-10, 10));
}

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, c_white, 1);