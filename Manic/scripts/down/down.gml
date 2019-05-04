///down(forwardDir);
///@param forwardDir
var forwardDir = argument0;
var downDir;

if (forwardDir < 90) || (forwardDir > 270){
	downDir = forwardDir - 90;
}else{
	downDir = forwardDir + 90;
}

return downDir;