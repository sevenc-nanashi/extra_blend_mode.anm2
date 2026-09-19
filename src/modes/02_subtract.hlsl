// label: 減算
float3 Blend(float3 s, float3 b) { return max(b - s, 0.0); }
