// label: 加算(RED)
float3 Blend(float3 s, float3 b) {
  return float3(min(s.r + b.r, 255.0), s.g, s.b);
}
