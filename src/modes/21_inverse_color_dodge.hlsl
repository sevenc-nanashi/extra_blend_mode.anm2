// label: 覆い焼き(逆カラー)
float3 Blend(float3 s, float3 b) { return min(s * 256.0 / (256.0 - b), 255.0); }
