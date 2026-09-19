// label: 陰影(焼き込み(リニア))
float3 Blend(float3 s, float3 b) { return max(s + b - 255.0, 0.0); }
