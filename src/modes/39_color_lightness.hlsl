// label: カラー(明度)
#include "../color.hlsl"
float3 Blend(float3 s, float3 b) {
  float3 sourceHsv = ToHsv(s);
  if (sourceHsv.y == 0.0)
    return b;
  return FromHsv(float3(sourceHsv.xy, MaxChannel(b)));
}
