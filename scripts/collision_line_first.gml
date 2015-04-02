//collision_line_first(x1,y1,x2,y2,obj,prec,notme,returnto)
// Takes the same parameters as the built-in collision_line(), with an option object to return to at the end.
// It returns the *first* instance along the line from x1, y1 to x2, y2
// It also sets collision_x and collision_y to the exact hit location for the calling object
// It can also provide any other object the colision data with the optional 8th argument.

//Declare arguments
var x1, y1, x2, y2, obj, prec, notme,return_object;
return_object = 0;
x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
obj = argument4;
prec = argument5;
notme = argument6;
return_object = argument7;

//Declare internals
var dx, dy, instance, first_instance;

//Get the first hit
first_instance = collision_line(x1, y1, x2, y2, obj, prec, notme);

if first_instance!=noone
    {
    if first_instance.object_index!=par_block
        {
        if object_get_parent(first_instance)=parent_bullet//bullet
            {
            with(first_instance){instance_destroy()}
            }
            else//monster
            {
            if first_instance>0{first_instance.helth-=obj_bullet.str}
            }
        }
    }

//If hit find the exact hit
if(first_instance != noone)
{
//Get x and y segment lengths
dx = x2 - x1
dy = y2 - y1

//Perform check while distances are greater or equal to 1
while (abs(dx) >= 1 or abs(dy) >= 1)
{
//Divide the modifier distance by 2 every cycle
dx /= 2;
dy /= 2;

//Check the new collison line modified by pulling back the end of the hit line by half the distance each loop.
instance = collision_line(x1, y1, x2-dx, y2-dy, obj, prec, notme);

//If we still hit the instance we didn't move back far enough to get outside of it.
if(instance != noone)
{
//set the found instance to what we hit, and pull back the line end by the current modifier
first_instance=instance;
x2 -= dx;
y2 -= dy;
}
}


//Return extra variables to returning object if set.
if(return_object != 0)
{
return_object.collision_x = x2-dx;
return_object.collision_y = y2-(dy*2);
}
else
{
collision_x = x2-dx;
collision_y = y2-(dy*2);
}

return first_instance;
}
