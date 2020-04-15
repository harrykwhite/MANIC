///@param score
var _score = argument0;

var txt = string(_score);
var minchars = 8;

while(string_length(txt) < minchars){
	txt = "0" + txt;
}

return txt;