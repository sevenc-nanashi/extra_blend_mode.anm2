// label: 焼き込み(ソフト)
float BlendChannel(float s, float b) {
  return s + b < 256.0 ? s * 127.5 / (256.0 - b)
                       : 255.0 - (256.0 - b) * 255.0 / (2.0 * (s + 1.0));
}

float3 Blend(float3 s, float3 b) {
  return float3(BlendChannel(s.r, b.r), BlendChannel(s.g, b.g),
                BlendChannel(s.b, b.b));
}
