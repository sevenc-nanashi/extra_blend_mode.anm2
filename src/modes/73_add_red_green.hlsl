// label: 加算(RED-GREEN)
float3 Blend(float3 s, float3 b) {
  return float3(min(s.r + b.r, 255.0), min(s.g + b.g, 255.0), s.b);
}
