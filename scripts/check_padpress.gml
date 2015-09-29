

if (round(gamepad_axis_value(0, gp_axislh)*3)/3)!=0{return true}
if (round(gamepad_axis_value(0, gp_axisrh)*3)/3)!=0{return true}
if (round(gamepad_axis_value(0, gp_axislv)*3)/3)!=0{return true}
if (round(gamepad_axis_value(0, gp_axisrv)*3)/3)!=0{return true}

/*
if gamepad_axis_value(0, gp_axislh)!=0{return true}
if gamepad_axis_value(0, gp_axisrh)!=0{return true}
if gamepad_axis_value(0, gp_axislv)!=0{return true}
if gamepad_axis_value(0, gp_axisrv)!=0{return true}
*/


if gamepad_button_check(0, gp_face1){return true}
if gamepad_button_check(0, gp_face2){return true}
if gamepad_button_check(0, gp_face3){return true}
if gamepad_button_check(0, gp_face4){return true}
if gamepad_button_check(0, gp_select){return true}
if gamepad_button_check(0, gp_start){return true}

return false;
