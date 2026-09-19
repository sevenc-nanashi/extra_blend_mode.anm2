// label: 彩度(明度)
#include "../color.hlsl"
float3 Blend(float3 s, float3 b) {
  return FromHsv(float3(Hue(b), ToHsv(s).y, MaxChannel(b)));
}
