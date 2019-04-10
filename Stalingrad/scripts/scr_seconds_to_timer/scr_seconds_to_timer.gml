///@param seconds
var seconds = argument0;
var str = "";

var minutes = seconds div 60;
var remainingseconds = seconds - (60 * minutes);

str = string(minutes) + ":";

if (remainingseconds < 10){
	 str += "0" + string(remainingseconds);
}else{
	str += string(remainingseconds);
}

return str;