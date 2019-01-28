uniform vec3 lightDirectionUniform;
varying vec3 view_vector;
varying vec3 normal_vector;
varying vec3 light_vector;



void main() {

	// TODO: PART 1A
    // Transform view to view coords
    view_vector = vec3(modelViewMatrix * vec4(position, 1.0));

    //Transform normal to view coords
    normal_vector = normalMatrix * normal;

    //Transform light to view coords
    light_vector = vec3(viewMatrix * vec4(lightDirectionUniform, 0.0));

   
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}