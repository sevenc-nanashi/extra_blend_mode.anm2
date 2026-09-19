// label: 彩度(輝度)
#include "../color.hlsl"
float3 Blend(float3 s, float3 b) {
  float3 backgroundHsl = ToHsl(b);
  return FromHsl(float3(backgroundHsl.x, ToHsl(s).y, backgroundHsl.z));
}
