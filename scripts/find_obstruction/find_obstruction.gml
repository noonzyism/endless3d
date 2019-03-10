/// find_obstruction(x0, y0, x1, y1, tolerance)
// checks if a collision map tile exists on the line between (x0, y0) and (x1, y1)
// if so, returns the point of collision, else undefined
//
//      x0,y0       first point on collision line, real
//      x1,y1       second point on collision line, real
//		tolerance	the lower the number, the more precise the detection
{
    var ox,oy,dx,dy, tolerance;
    ox = argument0;
    oy = argument1;
    dx = argument2;
    dy = argument3;
	tolerance = argument4;
	
	var points;
	
	if (abs(ox - dx) < tolerance) && (abs(ox - dx) < tolerance) {
		return undefined;
	}
	
	var collision_map = layer_tilemap_get_id(layer_get_id("collision_map"));
	
	var mx = (ox + dx) / 2;
	var my = (oy + dy) / 2;
	
	var mid = tilemap_get_at_pixel(collision_map, mx, my) & tile_index_mask;
	
	if (mid != 0) {
		points[0] = mx;
		points[1] = my;
		return points;
	}
	
	points = find_obstruction(ox, oy, mx, my, tolerance);
	
	if (points != undefined) {
		return points;
	}
	
	return find_obstruction(mx, my, dx, dy, tolerance);
	
}