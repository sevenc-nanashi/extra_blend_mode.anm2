// label: ネガ
float3 Blend(float3 s, float3 b) { return 255.0 - abs(255.0 - s - b); }
