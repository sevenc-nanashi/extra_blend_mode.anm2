// label: 暖色
float3 Blend(float3 s, float3 b) {
  return max(255.0 - (255.0 - s) * (255.0 - s) / (b + 1.0), 0.0);
}
