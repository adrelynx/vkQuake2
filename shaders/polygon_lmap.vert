#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(location = 0) in vec3 inVertex;
layout(location = 1) in vec2 inTexCoord;
layout(location = 2) in vec2 inTexCoordLmap;

layout(binding = 0) uniform UniformBufferObject
{
    mat4 mvpMatrix;
    float viewLightmaps;
} ubo;

layout(location = 0) out vec2 texCoord;
layout(location = 1) out vec2 texCoordLmap;
layout(location = 2) out float viewLightmaps;

out gl_PerVertex {
    vec4 gl_Position;
};

void main() {
    gl_Position = ubo.mvpMatrix * vec4(inVertex, 1.0);
    texCoord = inTexCoord;
    texCoordLmap = inTexCoordLmap;
    viewLightmaps = ubo.viewLightmaps;
}
