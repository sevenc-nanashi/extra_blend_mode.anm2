// label: 加算(unsigned)
float3 Blend(float3 s, float3 b) { return float3((uint3)(s + b) & 255u); }
