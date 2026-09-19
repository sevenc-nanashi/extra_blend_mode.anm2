// label: 色相(δ)
#include "../color.hlsl"
float3 Blend(float3 s, float3 b) {
  float3 sourceHsv = ToHsv(s);
  float backgroundHue = Hue(b);
  float delta = sourceHsv.x - backgroundHue;
  if (delta < 0.0)
    delta += 360.0;
  float hue = backgroundHue - sourceHsv.z * sourceHsv.y * delta / 255.0;
  return HueRange(hue, MinChannel(b), MaxChannel(b));
}
