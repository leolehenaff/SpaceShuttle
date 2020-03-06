attribute vec3 position;
uniform float currentTime;
uniform mat4 objectMatrix;
uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;

varying vec4 vColor;

void main() {

    const float height = 500.0;
    const float startSize = 50000.0;
    const float endSize = 45000.0;
    const vec4 startColor = vec4( 1.0, 0.0, 0.0, 1.0);
    const vec4 endColor = vec4( 0.0, 1.0, 0.0, 0.25);

    float particuleLife01 = fract(currentTime+position[2]);


    vec4 pos4 = vec4(position, 1.0);
    pos4.z = pos4.z+particuleLife01*(height);
    gl_Position = projectionMatrix * viewMatrix * objectMatrix * pos4;
    gl_PointSize = startSize/gl_Position.z - endSize*particuleLife01/gl_Position.z;
    vColor = mix(startColor,endColor,particuleLife01);


}