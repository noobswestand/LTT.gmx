/*

Syntax: obfuscate(string[,offset])

Arguments:
String - String to obfuscate
[Offset] - Optional. A number between 0 and 197. Simply offsets the ASCII
   numbers and seperator character by that amount, as a TINY bit of
   extra obfuscation.

Returns: An obfuscated string.

*/
var str,char;
str="";
arg1=global.OffSet
//arg1=max(0,min(197,arg1));
char=chr(58+arg1);
while (string_length(argument0)>0) {
str+=string(ord(string_char_at(argument0,1))+arg1)+char;
argument0=string_delete(argument0,1,1);
}
return str;