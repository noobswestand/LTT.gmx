///string_invert(str)
var buff;
buff="";
for(_asdf23423 = 1; _asdf23423 <= string_length(argument0); _asdf23423 += 1)
    {
    buff += chr(~ord(string_char_at(argument0, _asdf23423)));
    }

return buff;