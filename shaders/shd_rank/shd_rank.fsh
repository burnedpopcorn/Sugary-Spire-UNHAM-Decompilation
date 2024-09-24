varying vec2 v_texcoord;
varying vec4 v_vColour;

uniform float time;
uniform vec2 mouse_pos;
uniform vec2 resolution;
uniform float strength;

uniform vec3 u_light;
uniform vec3 u_dark;

void main()
{
	vec3 endcol = u_light;
	vec4 colour = texture2D(gm_BaseTexture, v_texcoord);
	if (distance(colour, vec4(0, 0, 0, 1)) <= 0.004)
		endcol = u_dark;
    gl_FragColor.rgb = endcol;
    gl_FragColor.a = v_vColour.a * colour.a;
}

