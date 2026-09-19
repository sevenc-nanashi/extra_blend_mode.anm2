// label: RED
float3 Blend(float3 s, float3 b) {
  return float3(255.0 - (255.0 - s.r) * (255.0 - b.r) / 255.0, b.g, b.b);
}
