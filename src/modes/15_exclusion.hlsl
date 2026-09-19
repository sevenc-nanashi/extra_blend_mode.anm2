// label: 除外
float3 Blend(float3 s, float3 b) { return s + b - 2.0 * s * b / 255.0; }
