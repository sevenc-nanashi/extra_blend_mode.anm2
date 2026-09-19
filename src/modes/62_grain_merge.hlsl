// label: 微粒結合
float3 Blend(float3 s, float3 b) { return clamp(b + s - 128.0, 0.0, 255.0); }
