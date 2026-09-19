// label: ハードライト
float BlendChannel(float s, float b) {
  return s <= 128.0 ? 2.0 * s * b / 256.0
                    : 255.0 - (255.0 - b) * (511.0 - 2.0 * s) / 255.0;
}

float3 Blend(float3 s, float3 b) {
  return float3(BlendChannel(s.r, b.r), BlendChannel(s.g, b.g),
                BlendChannel(s.b, b.b));
}
