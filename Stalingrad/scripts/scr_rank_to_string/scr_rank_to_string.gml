///@param rank
var rank = argument0;
var r = "";

switch(rank){
	
	// E
	case Grade.EMinus:
		r = "E-";
		break;
	
	case Grade.E:
		r = "E";
		break;
	
	case Grade.EPlus:
		r = "E+";
		break;
	
	// D
	case Grade.DMinus:
		r = "D-";
		break;
	
	case Grade.D:
		r = "D";
		break;
	
	case Grade.DPlus:
		r = "D+";
		break;
	
	// C
	case Grade.CMinus:
		r = "C-";
		break;
	
	case Grade.C:
		r = "C";
		break;
	
	case Grade.CPlus:
		r = "C+";
		break;
	
	// B
	case Grade.BMinus:
		r = "B-";
		break;
	
	case Grade.B:
		r = "B";
		break;
	
	case Grade.BPlus:
		r = "B+";
		break;
	
	// A
	case Grade.AMinus:
		r = "A-";
		break;
	
	case Grade.A:
		r = "A";
		break;
	
	case Grade.APlus:
		r = "A+";
		break;
		
	// S
	case Grade.S:
		r = "S";
		break;
}

return r;