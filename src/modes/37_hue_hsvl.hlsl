// label: 色相(HSVL)
#include "../color.hlsl"
float3 Blend(float3 s, float3 b) {
  float3 sourceHsv = ToHsv(s);
  if (sourceHsv.y == 0.0)
    return b;
  return FromHsvl(sourceHsv.x, ToHsv(b).y, Luma(b));
}
