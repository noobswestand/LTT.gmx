///scr_speedCalc()
var _te=1;
if freeze>0{
    _te=-1/(freeze/* *.25 */)
}
if obj_control.PlayerSlowMode=true{
    return _te/2
}
return abs(_te)