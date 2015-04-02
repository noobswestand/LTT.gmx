///draw_rectangle_rotated(x1, y1, x2, y2, angle, rotx, roty, outline)
d3d_transform_set_identity();
d3d_transform_add_rotation_z(argument4);
d3d_transform_add_translation(argument5, argument6, 0);
draw_rectangle(argument0 - argument5, argument1 - argument6, argument2 - argument5, argument3 - argument6, argument7);
d3d_transform_set_identity();