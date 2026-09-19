// label: ソフトライト
float BlendChannel(float s, float b) {
  float exponent = s < 128.0 ? (255.0 - s) / 128.0 : 128.0 / s;
  return b == 0.0 ? 0.0 : 255.0 * pow(b / 255.0, exponent);
}

float3 Blend(float3 s, float3 b) {
  return float3(BlendChannel(s.r, b.r), BlendChannel(s.g, b.g),
                BlendChannel(s.b, b.b));
}
