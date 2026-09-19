// label: ハードミックス
float3 Blend(float3 s, float3 b) { return step(255.0, s + b) * 255.0; }
