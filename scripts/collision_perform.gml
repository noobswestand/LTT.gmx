//!--Find first object--!
//
//Argument0: Disable mirroring - If disabled line keeps going straight.
//                               Used for the laser-sender.
//Argument1: Angle of laser coming
//Argument2: X of shooting object
//Argument3: Y of shooting object
//Argument4: Laser color
//Argument5: Mirror parent object
//Argument6: Block object, used in this example
if argument7.gun6Speed<5{

draw_set_alpha(1)

//Get coordinates
x1=argument2
y1=argument3

//If mirroring disabled
if argument0 {
global.max_dist=500
angle=argument[1]
x2=x1+lengthdir_x(global.max_dist,angle)//ERROR HERE
y2=y1+lengthdir_y(global.max_dist,angle)

} else {

//Get the new angle
//rot=player.image_angle+90-argument1+player.image_angle+90+180
angle=0
rot=angle-argument1+angle+180
//Get the new line coordinates
x2=x1+lengthdir_x(global.max_dist,rot)
y2=y1+lengthdir_y(global.max_dist,rot)

}

//Find object
object=collision_line_first(x1,y1,x2,y2,argument5,1,1,argument7)

//Set drawing color
draw_set_color(argument4)

//If no object was found
if object = noone {

//Draw line to maximum distance
draw_line_width(x1,y1,x2,y2,3)
} else {

//Draw line to collision place
draw_line_width(x1,y1,collision_x,collision_y,3)

//Set the hit object's variables
object.cx=collision_x
object.cy=collision_y

//Let it know it's hit
object.hit=1

//Let it know the exact coordinates.
object.collision_x=collision_x
object.collision_y=collision_y

object.t_angle=point_direction(x1,y1,collision_x,collision_y)
with object {

//Block object, used in this example
if object_index=argument6 event_user(0);
argument7.gun6Speed+=1
//Repeat the whole process
collision_perform(0,t_angle,cx,cy,argument4,argument5,argument6,argument7)
}}
}
