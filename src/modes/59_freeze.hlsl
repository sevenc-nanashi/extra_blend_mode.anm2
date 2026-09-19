// label: 寒色
float3 Blend(float3 s, float3 b) {
  return max(255.0 - (255.0 - b) * (255.0 - b) / (s + 1.0), 0.0);
}
