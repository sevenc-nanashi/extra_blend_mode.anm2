// label: ビビッドライト(photoshop)
float VividChannel(float s, float b, bool upper) {
  if (upper)
    return 255.0 - (255.0 - b) * 255.0 / (2.0 * s - 255.0);

  if (s == 127.5)
    return b == 0.0 ? 0.0 : 255.0;
  return b * 255.0 / (255.0 - 2.0 * s);
}
float3 Blend(float3 s, float3 b) {
  return clamp(float3(VividChannel(s.r, b.r, s.r >= 128.0),
                      VividChannel(s.g, b.g, s.g > 128.0),
                      VividChannel(s.b, b.b, s.b > 128.0)),
               0.0, 255.0);
}
