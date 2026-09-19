// label: 二値化
float3 Blend(float3 s, float3 b) { return (1.0 - step(b, s)) * 255.0; }
