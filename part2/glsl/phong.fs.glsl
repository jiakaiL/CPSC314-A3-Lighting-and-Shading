varying vec3 view_vector;
varying vec3 normal_vector;
varying vec3 light_vector;

uniform vec3 lightColorUniform;
uniform vec3 ambientColorUniform;
uniform float kAmbientUniform;
uniform float kDiffuseUniform;
uniform float kSpecularUniform;
uniform float shininessUniform;





void main() {

	//TODO: PART 1A

	//view 
	vec3 v = normalize(view_vector);

	//normal
	vec3 n = normalize(normal_vector);

	//light
	vec3 l = normalize(light_vector);

	//dot product of n and l
	float nl_dot = dot(n,l);

	//interpolation value
	float interpolationValue = (1.0 + nl_dot)/2.0;

	vec3 u_objectColor = vec3(1.0, 1.0, 1.0);
	vec3 u_coolColor = vec3(30.0/255.0, 120.0/255.0, 210.0/255.0);
	vec3 u_warmColor = vec3(210.0/255.0, 120.0/255.0, 30.0/255.0);
	float u_alpha = 0.25;
	float u_beta = 0.5;

	vec3 coolColorMod = u_coolColor + u_objectColor * u_alpha;
	vec3 warmColorMod = u_warmColor + u_objectColor * u_beta;
	vec3 colorOut = mix(coolColorMod, warmColorMod, interpolationValue);
	gl_FragColor = vec4(colorOut, 1.0);

}