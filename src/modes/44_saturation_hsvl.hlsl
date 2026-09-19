// label: 彩度(HSVL)
#include "../color.hlsl"
float3 Blend(float3 s, float3 b) {
  return FromHsvl(Hue(b), ToHsv(s).y, Luma(b));
}
