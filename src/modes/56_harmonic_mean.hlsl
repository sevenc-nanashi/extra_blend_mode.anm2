// label: 調和平均
float BlendChannel(float s, float b) {

  return s + b == 0.0 ? 0.0 : 2.0 * s * b / (s + b);
}

float3 Blend(float3 s, float3 b) {
  return float3(BlendChannel(s.r, b.r), BlendChannel(s.g, b.g),
                BlendChannel(s.b, b.b));
}
