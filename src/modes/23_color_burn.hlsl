// label: 焼き込み(カラー)
float3 Blend(float3 s, float3 b) {
  return max(255.0 - (255.0 - b) * 256.0 / (s + 1.0), 0.0);
}
