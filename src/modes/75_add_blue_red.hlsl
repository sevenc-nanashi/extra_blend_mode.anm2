// label: 加算(BLUE-RED)
float3 Blend(float3 s, float3 b) {
  return float3(min(s.r + b.r, 255.0), s.g, min(s.b + b.b, 255.0));
}
