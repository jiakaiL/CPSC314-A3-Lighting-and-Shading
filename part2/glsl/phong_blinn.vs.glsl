varying vec2 texC;

void main() {

   texC = uv;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}