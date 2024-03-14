shader_type canvas_item;

uniform sampler2D mask;
uniform float scale : hint_range(0.0, 1.0, 0.1);


void fragment() {
	vec2 offset = vec2(0.5, 0.5) * (1.0 - scale);
	vec4 mask_color = texture(mask, UV * scale + offset);
	COLOR.a = 1.0 - mask_color.a;
}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
