// label: 覆い焼き(ソフト)
float BlendChannel(float s, float b) {
  return s + b < 255.0 ? b * 128.0 / (256.0 - s)
                       : 255.0 - (256.0 - s) / (2.0 * (b + 1.0));
}

float3 Blend(float3 s, float3 b) {
  return float3(BlendChannel(s.r, b.r), BlendChannel(s.g, b.g),
                BlendChannel(s.b, b.b));
}
