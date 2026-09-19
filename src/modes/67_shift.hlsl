// label: SHIFT
float3 Blend(float3 s, float3 b) {

  uint3 shift = (uint3)s & 7u;
  uint3 value = (uint3)b;
  return float3(((value << shift) | (value >> (8u - shift))) & 255u);
}
