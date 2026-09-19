// label: 加算(BLUE)
float3 Blend(float3 s, float3 b) {
  return float3(s.r, s.g, min(s.b + b.b, 255.0));
}
