varying vec3 normal_vector;
varying vec3 light_vector;
varying vec3 view_vector;


void main() {

	//TOTAL INTENSITY
	//TODO PART 1D: calculate light intensity	
	//normal
	vec3 n = normalize(normal_vector);

	//light
	vec3 l = normalize(light_vector);

	//view
	vec3 v = normalize(view_vector);

	//dot product of n and v
	float dot_vn = dot(-v,n);

	float lightIntensity = dot(l,n); 
	vec4 resultingColor;
	
	if (dot_vn >0.1){
	if (lightIntensity > 0.6){
		resultingColor = vec4(1.0, 1.0, 1.0, 1.0);
	}
	else if (lightIntensity > 0.45){
		resultingColor = vec4(1.0, 0.9, 0.9, 1.0);
	} 
	else if (lightIntensity > 0.35){
		resultingColor = vec4(1.0, 0.7, 0.7, 1.0);
	}
	else if (lightIntensity>0.25){
		resultingColor = vec4(1.0, 0.6, 0.6, 1.0);
	}else{
		resultingColor = vec4(1.0, 0.4,0.4,1.0);
	}}else{
		resultingColor = vec4(0.0, 0.0, 0.0,1.0);
	}


	if (lightIntensity < 0.6){
   		// hatch from left top corner to right bottom
   		if (mod(gl_FragCoord.x + gl_FragCoord.y, 10.0) == 0.0) {
      		resultingColor = vec4(0.0, 0.0, 0.0, 1.0);
   		}
	}

	if (lightIntensity < 0.45){
   		// hatch from right top corner to left boottom
   		if (mod(gl_FragCoord.x - gl_FragCoord.y, 10.0) == 0.0){
     		resultingColor = vec4(0.0, 0.0, 0.0, 1.0);
   		}
	}

	if (lightIntensity < 0.3){
   		// hatch from left top to right bottom
   		if (mod(gl_FragCoord.x + gl_FragCoord.y - 5.0, 10.0) == 0.0){
      		resultingColor = vec4(0.0, 0.0, 0.0, 1.0);
   		}
	}

	if (lightIntensity < 0.25){
   		// hatch from right top corner to left bottom
   		if (mod(gl_FragCoord.x - gl_FragCoord.y - 5.0, 10.0) == 0.0){
      		resultingColor = vec4(0.0, 0.0, 0.0, 1.0);
		}
	}

    

   	//TODO PART 1D: change resultingColor based on lightIntensity (toon shading)

   	//TODO PART 1D: change resultingColor to silhouette objects

	gl_FragColor = resultingColor;
}
