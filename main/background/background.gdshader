shader_type canvas_item;
uniform sampler2D overlay:repeat_enable;
uniform vec4 color1:source_color = vec4(0,0,0,1);
uniform vec4 color2:source_color = vec4(0,0,0,1);
uniform vec2 center = vec2(0.5,0.5);
void vertex() {
	// Called for every vertex the material is visible on.
}

mat2 rotate(float angle)
{
	return mat2(vec2(cos(angle),-sin(angle)),vec2(sin(angle),cos(angle)));
	
}

void fragment() {
	vec2 coords =  UV -center;
	coords = rotate(1.0) * coords;
	coords += center;
	
	vec4 overlay_text = texture(overlay,(coords+vec2(0.2) +vec2(TIME/60.0))*2.0);//*0.5) ;
	float overlay_pattern =  floor(overlay_text.a*2.0);
	
	COLOR =  mix(color1,color2,overlay_pattern);//olor - vec4(0.5);
	// Called for every pixel the material is visible on.
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
