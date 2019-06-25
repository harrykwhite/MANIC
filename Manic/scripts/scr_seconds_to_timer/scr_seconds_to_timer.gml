///@param seconds
var seconds = argument0;
var str = "";

var minutes = seconds div 60;
var hours = minutes div 60;

var remainingminutes = minutes - (60 * hours);
var remainingseconds = seconds - (60 * minutes);

str = string(hours) + ":";

if (remainingminutes < 10){
	 str += "0" + string(remainingminutes) + ":";
}else{
	str += string(remainingminutes) + ":";
}

if (remainingseconds < 10){
	 str += "0" + string(remainingseconds);
}else{
	str += string(remainingseconds);
}

return str;