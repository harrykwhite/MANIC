//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float roffset;
uniform float goffset;
uniform float boffset;

void main()
{
	vec4 basecol = texture2D(gm_BaseTexture, v_vTexcoord);
	float basealpha = v_vColour.a;
	vec4 newcol = vec4(basecol.r + roffset, basecol.g + goffset, basecol.b + boffset, basealpha);
	
	gl_FragColor = newcol;
}
