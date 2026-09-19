// label: ピンライト(逆)
float BlendChannel(float s, float b) {
  return s < 128.0 ? min(s, b) : max(s, b);
}

float3 Blend(float3 s, float3 b) {
  return float3(BlendChannel(s.r, b.r), BlendChannel(s.g, b.g),
                BlendChannel(s.b, b.b));
}
