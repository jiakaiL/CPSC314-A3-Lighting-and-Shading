varying vec3 view_vector;
varying vec3 normal_vector;
varying vec3 light_vector;

uniform vec3 lightColorUniform;
uniform vec3 ambientColorUniform;
uniform float kAmbientUniform;
uniform float kDiffuseUniform;
uniform float kSpecularUniform;
uniform float shininessUniform;
uniform float alphaXUniform;
uniform float alphaYUniform;

void main() {

	//TODO: PART 1C

	//view 
	vec3 v = normalize(view_vector);

	//normal
	vec3 n = normalize(normal_vector);

	//light
	vec3 l = normalize(light_vector);

	//dot product of n and l
	float nl_dot = dot(n,l);

	//half vector between l and v;
	vec3 h = normalize(l+ (-v));

	//dot product of h and n 
	float dot_nh = dot(n,h);

	//dot product of v and n
	float dot_vn = dot(-v,n);

	//T vector 
	vec3 up = vec3(0,1,0);
	vec3 t = normalize(cross(n,up));

	//B vector
	vec3 b = normalize(cross(n,t));

	//dot product of h and t
	float dot_th = dot(t,h);

	//dot product of h and b
	float dot_bh = dot(h,b);

	//specular term
	float alpha_x = pow((dot_th/alphaXUniform), 2.0);
	float alpha_y = pow((dot_bh/alphaYUniform),2.0);
	float sqrt_part = sqrt(nl_dot/dot_vn);
	float exponential_inside = (-2.0) * (alpha_x + alpha_y) /(1.0+dot_nh);
	float exponential_part = exp(exponential_inside);
	
	float tangent = sqrt_part * exponential_part;
	

	//AMBIENT
	vec3 light_AMB = ambientColorUniform * kAmbientUniform;

	//DIFFUSE
	vec3 light_DFF = lightColorUniform * kDiffuseUniform * nl_dot;

	//SPECULAR
	vec3 light_SPC = lightColorUniform * kSpecularUniform * tangent;

	//TOTAL
	vec3 TOTAL = light_AMB + light_DFF + light_SPC;
	gl_FragColor = vec4(TOTAL, 0.0);

}