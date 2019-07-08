if (other.y > y + 15){
	if (other.time <= 0) other.shake = 2;
	other.bend = true;
	other.time = 60 * 2;
}