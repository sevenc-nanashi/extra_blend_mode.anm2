// label: 減算(unsigned)
float3 Blend(float3 s, float3 b) { return float3((int3)(b - s) & 255); }
