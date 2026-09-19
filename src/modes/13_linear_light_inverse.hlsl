// label: 明暗(逆)
float3 Blend(float3 s, float3 b) {
  return clamp(s + 2.0 * b - 255.0, 0.0, 255.0);
}
