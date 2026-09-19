// label: 覆い焼き(カラー)
float3 Blend(float3 s, float3 b) { return min(b * 256.0 / (256.0 - s), 255.0); }
