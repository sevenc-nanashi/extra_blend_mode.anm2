// label: 色差
#include "../color.hlsl"
float3 Blend(float3 s, float3 b) { return clamp(s + Luma(b - s), 0.0, 255.0); }
