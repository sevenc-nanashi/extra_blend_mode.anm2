// label: オーバーレイ(gimp)
float3 Blend(float3 s, float3 b) {
  return b / 255.0 * (b + (255.0 - b) * (2.0 * s / 255.0));
}
