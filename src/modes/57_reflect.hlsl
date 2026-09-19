// label: 反射
float3 Blend(float3 s, float3 b) { return min(s * s / (256.0 - b), 255.0); }
