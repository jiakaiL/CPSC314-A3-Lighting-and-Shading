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

	//TODO: PART 1B

	//view 
	vec3 v = normalize(view_vector);

	//normal
	vec3 n = normalize(normal_vector);

	//light
	vec3 l = normalize(light_vector);

	//dot product of n and l
	float nl_dot = max(dot(n,l), 0.0);

	//half vector between l and v;
	vec3 h = normalize(l+ (-v));

	//dot product of h and n 
	float dot_nh = max(dot(n,h),0.0);

	//AMBIENT
	vec3 light_AMB = ambientColorUniform * kAmbientUniform;

	//DIFFUSE
	vec3 light_DFF = lightColorUniform * kDiffuseUniform * nl_dot;

	//SPECULAR
	vec3 light_SPC = lightColorUniform * kSpecularUniform * pow(dot_nh, shininessUniform);

	//TOTAL
	vec3 TOTAL = light_AMB + light_DFF + light_SPC;
	gl_FragColor = vec4(TOTAL, 0.0);

}