uniform sampler2D textureMidUniform;
varying vec2 texC;

void main() {

	vec4 textColor = texture2D(textureMidUniform, texC);
	gl_FragColor = textColor;

}