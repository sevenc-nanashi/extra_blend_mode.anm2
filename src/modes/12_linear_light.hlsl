// label: 明暗(リニアライト)
float3 Blend(float3 s, float3 b) {
  return clamp(b + 2.0 * s - 255.0, 0.0, 255.0);
}
