varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float _alpha;
uniform float _red;
uniform float _green;
uniform float _blue;

void main()
{
    vec4 colour = texture2D( gm_BaseTexture, v_vTexcoord );
	colour.r = _red;
	colour.g = _green;
	colour.b = _blue;
	
	gl_FragColor = colour;
}
