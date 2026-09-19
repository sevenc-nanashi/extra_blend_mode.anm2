Texture2D<float4> Source : register(t0);
Texture2D<float4> Background : register(t1);

float4 ENTRY(float4 pos : SV_Position) : SV_Target {
  int3 pixel = int3(pos.xy, 0);
  float4 source = Source.Load(pixel);
  float4 background = Background.Load(pixel);
  if (source.a <= 0.0)
    return background;
  if (background.a <= 0.0)
    return source;

  float3 s = saturate(source.rgb / source.a);
  float3 b = saturate(background.rgb / background.a);
  float overlap = source.a * background.a;
  float sourceOnly = source.a * (1.0 - background.a);
  float backgroundOnly = background.a * (1.0 - source.a);
  float3 mixed = saturate(Blend(s * 255.0, b * 255.0) / 255.0);
  // 非乗算の合成結果を、出力アルファで割らずに返す。
  return float4(s * sourceOnly + b * backgroundOnly + mixed * overlap,
                source.a + backgroundOnly);
}
