// label: グロー
float3 Blend(float3 s, float3 b) { return min(b * b / (256.0 - s), 255.0); }
