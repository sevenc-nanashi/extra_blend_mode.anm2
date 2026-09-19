// label: スクリーン
float3 Blend(float3 s, float3 b) {
  return 255.0 - (255.0 - s) * (255.0 - b) / 255.0;
}
