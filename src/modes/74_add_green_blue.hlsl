// label: 加算(GREEN-BLUE)
float3 Blend(float3 s, float3 b) {
  return float3(s.r, min(s.g + b.g, 255.0), min(s.b + b.b, 255.0));
}
