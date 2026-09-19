// label: 反転
#include "../color.hlsl"
float3 Blend(float3 s, float3 b) { return Luma(s - b) > 0.0 ? 255.0 - b : b; }
