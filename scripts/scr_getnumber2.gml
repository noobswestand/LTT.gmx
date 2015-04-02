///scr_getnumber2(number)
//returns string

var aaaaaaa, _str001, len;

_str001 = string(argument0)
len = string_length(_str001)
for (aaaaaaa = 3; aaaaaaa <= len-1; aaaaaaa += 3){_str001 = string_insert(",", _str001, len - aaaaaaa);}

if string_char_at(_str001,1)=","{_str001=string_delete(_str001,1,1)}

return _str001;