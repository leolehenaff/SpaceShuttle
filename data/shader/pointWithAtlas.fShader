precision highp float;

uniform sampler2D texture0;
varying vec2 uvMapping;

void main() {
    vec2 coord = uvMapping + vec2( gl_PointCoord.x, 1.0 - gl_PointCoord.y ) * 0.5;
    gl_FragColor = texture2D( texture0, coord);
}
