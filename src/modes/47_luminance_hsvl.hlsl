// label: 輝度(HSVL)
#include "../color.hlsl"
float3 Blend(float3 s, float3 b) {
  return FromHsvl(Hue(b), ToHsv(b).y, Luma(s));
}
