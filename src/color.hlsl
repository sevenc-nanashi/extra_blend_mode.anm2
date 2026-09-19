// RGB・HSV の V・輝度は 0..255、色相は度、彩度・HSL の L は 0..1。
float MinChannel(float3 c) { return min(c.r, min(c.g, c.b)); }
float MaxChannel(float3 c) { return max(c.r, max(c.g, c.b)); }
// BT.601 の輝度係数。
float Luma(float3 c) { return dot(c, float3(0.299, 0.587, 0.114)); }

float Hue(float3 c) {
  float high = MaxChannel(c);
  float chroma = high - MinChannel(c);
  if (chroma == 0.0)
    return 0.0;
  float hue;
  if (high == c.r)
    hue = 60.0 * (c.g - c.b) / chroma;
  else if (high == c.g)
    hue = 60.0 * ((c.b - c.r) / chroma + 2.0);
  else
    hue = 60.0 * ((c.r - c.g) / chroma + 4.0);
  return hue < 0.0 ? hue + 360.0 : hue;
}

float3 HueRange(float hue, float low, float high) {
  hue = frac(hue / 360.0) * 6.0;
  float3 unit;
  if (hue < 1.0)
    unit = float3(1, hue, 0);
  else if (hue < 2.0)
    unit = float3(2.0 - hue, 1, 0);
  else if (hue < 3.0)
    unit = float3(0, 1, hue - 2.0);
  else if (hue < 4.0)
    unit = float3(0, 4.0 - hue, 1);
  else if (hue < 5.0)
    unit = float3(hue - 4.0, 0, 1);
  else
    unit = float3(1, 0, 6.0 - hue);
  return low + (high - low) * unit;
}

float3 ToHsv(float3 c) {
  float high = MaxChannel(c);
  float chroma = high - MinChannel(c);
  return float3(Hue(c), high == 0.0 ? 0.0 : chroma / high, high);
}

float3 FromHsv(float3 hsv) {
  return HueRange(hsv.x, (1.0 - hsv.y) * hsv.z, hsv.z);
}

float3 ToHsl(float3 c) {
  float low = MinChannel(c) / 255.0;
  float high = MaxChannel(c) / 255.0;
  float lightness = (high + low) * 0.5;
  if (high == low)
    return float3(0, 0, lightness);
  float saturation =
      (high - low) / (lightness <= 0.5 ? high + low : 2.0 - high - low);
  return float3(Hue(c), saturation, lightness);
}

float3 FromHsl(float3 hsl) {
  float halfChroma = (1.0 - abs(2.0 * hsl.z - 1.0)) * hsl.y * 0.5;
  return HueRange(hsl.x, (hsl.z - halfChroma) * 255.0,
                  (hsl.z + halfChroma) * 255.0);
}

float3 FromHsvl(float hue, float saturation, float luminance) {
  float3 color = HueRange(hue, 1.0 - saturation, 1.0);
  // 色相・彩度を保ったまま、指定された輝度へスケールする。
  return clamp(color * (luminance / Luma(color)), 0.0, 255.0);
}
