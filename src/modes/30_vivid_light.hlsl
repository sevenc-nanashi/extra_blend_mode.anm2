// label: ビビッドライト
float VividChannel(float s, float b, bool upper) {
  return upper ? b * 255.0 / (511.0 - 2.0 * s)
               : 255.0 - (255.0 - b) * 255.0 / (2.0 * (s + 1.0));
}
float3 Blend(float3 s, float3 b) {
  return clamp(float3(VividChannel(s.r, b.r, s.r >= 128.0),
                      VividChannel(s.g, b.g, s.g > 128.0),
                      VividChannel(s.b, b.b, s.b > 128.0)),
               0.0, 255.0);
}
