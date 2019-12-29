varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float _red;
uniform float _green;
uniform float _blue;
uniform float _alpha;

void main()
{
	vec4 thisColor = texture2D( gm_BaseTexture, v_vTexcoord);
	float alpha = thisColor.a;
	
	if (alpha == 0.0){
		discard;
	}
	
	if (alpha > 0.3){
		gl_FragColor = vec4(_red, _green, _blue, _alpha);
	}else{
		gl_FragColor = thisColor;
	}
}
