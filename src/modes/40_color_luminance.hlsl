// label: カラー(輝度)
#include "../color.hlsl"
float3 Blend(float3 s, float3 b) {
  float3 sourceHsl = ToHsl(s);
  if (sourceHsl.y == 0.0)
    return b;
  return FromHsl(float3(sourceHsl.xy, (MinChannel(b) + MaxChannel(b)) / 510.0));
}
