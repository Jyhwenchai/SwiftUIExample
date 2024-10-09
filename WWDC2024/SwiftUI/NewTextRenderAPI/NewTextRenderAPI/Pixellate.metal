//
//  Pixellate.metal
//  NewTextRenderAPI
//
//  Created by 蔡志文 on 6/18/24.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[stitchable]] float2 pixellate(float2 position, float size) {
  float2 pixellatedPosition = round(position / size) * size;
  return pixellatedPosition;
}


