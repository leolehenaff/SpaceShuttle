precision highp float;
varying vec4 vColor;
uniform sampler2D texture0;

void main() {
    gl_FragColor = texture2D(texture0, gl_PointCoord) * vColor;
}