// label: 除算
float3 Blend(float3 s, float3 b) { return min(b * 256.0 / (s + 1.0), 255.0); }
