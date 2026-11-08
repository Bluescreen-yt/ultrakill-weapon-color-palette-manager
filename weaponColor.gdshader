shader_type spatial;
uniform vec4 clr1: source_color = vec4(0);
uniform vec4 clr2: source_color = vec4(0);
uniform vec4 clr3: source_color = vec4(0);
uniform sampler2D id;
uniform sampler2D emmisive;

void fragment() {
	vec4 ID = texture(id, UV);
	vec4 final_color = vec4(0);
	
	if ( ID.r>ID.g+ID.b ) {
		final_color = clr1;
	}
	if ( ID.g>ID.r+ID.b ) {
		final_color = clr2;
	}
	if ( ID.b>ID.g+ID.r ) {
		final_color = clr3;
	}
	
	ALBEDO = final_color.rgb;
	ALBEDO *= vec3(ID.a);
	EMISSION = texture(emmisive, UV).rgb*texture(emmisive, UV).a*2.;
	
}
