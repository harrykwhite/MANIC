///up(forwardDir);
///@param forwardDir
var forwardDir = argument0;
var upDir;

if (forwardDir < 90) || (forwardDir > 270){
	upDir = forwardDir + 90;
}else{
	upDir = forwardDir - 90;
}

return upDir;