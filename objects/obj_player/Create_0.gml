/// @description player creation code

username = "jones";

xspeed = 0;
yspeed = 0;

//the movement speed per step
velocity = 10;

shooting = false;
weapon = Weapons.ASSAULT_RIFLE;
cooldown = false;

//match-related variables
team = false; //team? boolean (true = blue, false = red)
matchscore = 0;
kills = 0;
deaths = 0;
objhold = false; //holding objective? boolean

hp = 100;

//collision-related vars
collision_map = layer_tilemap_get_id(layer_get_id("collision_map"));

//boundary offsets from the sprite origin
left_offset = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
right_offset = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
bottom_offset = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
top_offset = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

//instance_create_depth(x, y, depth, obj_peer);