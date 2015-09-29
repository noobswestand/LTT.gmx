/*

Syntax: unobfuscate(string[,offset])

Arguments:
String - String to unobfuscate (reverse of obfuscation).
[Offset] - Optional. A number between 0 and 197. Simply offsets the ASCII
   numbers and seperator character by that amount, as a TINY bit of
   extra obfuscation. If this was supplied in the obfuscation call,
   it MUST match here or else the string will be unobfuscated incorrectly
   or not at all.

Returns: An unobfuscated string.

*/

var str,copy,char;
str='';
arg1=global.OffSet
arg1=max(0,min(197,arg1));
char=chr(58+arg1);
while (string_pos(char,argument0)>0) {
copy=string_copy(argument0,1,string_pos(char,argument0)-1);
argument0=string_delete(argument0,1,string_pos(char,argument0));
str+=chr(real(copy)-arg1);
}
return str;
