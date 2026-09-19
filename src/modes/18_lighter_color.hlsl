// label: カラー比較(明)
float3 Blend(float3 s, float3 b) {
  return dot(s, float3(1, 1, 1)) < dot(b, float3(1, 1, 1)) ? b : s;
}
