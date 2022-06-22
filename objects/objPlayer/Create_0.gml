// Inherit the parent event
event_inherited();

image_speed = 0;

inputX = 0;
inputY = 0;

p_jump = false;				// check if jump was pressed, and whether jump was pressed previously
p_dash = false;				// check if jump was pressed, and whether jump was pressed previously
grace = 0;					// grace period is when player just started to fall and still can jump, 6 frames total, while not on ground, -1 per frame
jbuffer = 0;				// jump buffer: while jump key is pressed, jbuffer is 4; jbuffer > 0 so madeline can jump
djump = global.max_djump;	// how many times can Madeline dash in the air, default to 1, level up to 2
dash_time = 0;				// dash_time > 0 means madeline is dashing, while dash key is pressed, dash_time is 4
dash_effect_time = 0;		// for checking collision with the fake wall, dash and 10 frames later, collide with fake wall, fake wall will break

dash_target_x = 0.0;		// dd f zarget, the precise position that madeline is about to dash, 2 * (sign(spd.x), sign(spd.y))
dash_target_y = 0.0;

dash_accel_x = 0.0;			// default is 1.5, will be timed with sqrt(2)/2 (cos(45)) while ...
dash_accel_y = 0.0;			// default is 1.5, will be timed with sqrt(2)/2 (sin(45)) while ...

was_on_ground = false;		// if the player was on ground in the last step
on_ground = false;			// if the player is on ground
on_ice = false;				// if the player is on ice


dash = false;				// if it's a valid dash(i.e. just press dash and no_dash on previous frame)
jump = false;				// if it's a valid jump(i.e. just press jump and no_jump on previous frame)

maxrun = 0.0;				// for moving state, maxrun = 1
accel = 0.0;				// for moving state
deccel = 0.0;				// for moving state

maxfall = 0.0;				// maxfall = 2, if wall_slide, maxfall = 0.4
grav = 0.0;					// gravity = 0.21, if madeline is on top of her jump trajectory, gravity would be half, so madeline could stay on-air a little longer

wall_dir = 0;				// if on-air, if there is a wall 3-pixel away, madeline could perform a wall-jump; 
							// wall_dir = 0, no wall-jump
							// wall_dir = 1, wall is on her right side, madeline will jump left
							// wall_dir = -1, wall is on her left side, madeline will jump right

d_full = 0.0;				// d_full(5.0) and d_half deal with the spd.x and spd.y directly
d_half = 0.0;				// d_half = sin(45) * d_full, or cos(45) * d_full

sprOffset = 0.0;

