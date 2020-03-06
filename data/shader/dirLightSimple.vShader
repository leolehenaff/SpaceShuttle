attribute vec3 position;
attribute vec3 normal;
attribute vec2 uv;

uniform mat4 objectMatrix;
uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform vec3 lightDir;

varying vec3 vColor;
varying vec2 vUv;

void main() {
    vec3 wNormal = (objectMatrix * vec4(normalize(normal),0.0)).xyz;
    //float nDotL = dot(normalize(lightDir),normalize(normal))*0.5 + 0.5;
    //contrasted version
    //float nDotL = max(dot(normalize(lightDir),normalize(normal)),0);
    float nDotL = dot(normalize(lightDir),normalize(wNormal))*0.5 + 0.5;
    vColor = vec3(nDotL);
    vUv = uv;
    gl_Position = projectionMatrix * viewMatrix * objectMatrix * vec4(position, 1.0);
}