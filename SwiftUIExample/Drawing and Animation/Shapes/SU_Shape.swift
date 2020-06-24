//
//  SU_Shape.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/26.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `Shape` 协议
 
 所有遵循 `Shape` 的形状都可以调用其中的实例方法，这些方法包括对形状的填充、描边、偏移、路径的绘制、选择、缩放、尺寸以及二维变化等操作
 */
struct SU_Shape: View {
    var body: some View {
        VStack(spacing: 40) {
            Rectangle()
                // 可以使用 trim 调整描边的范围
                .trim(from: 0.2, to: 1)
                .stroke(Color.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .bevel, dash: [15, 15]))
                .offset(x: 20, y: 20)
                .rotationEffect(Angle(degrees: 45))
                .scaleEffect(0.8)
                .transformEffect(CGAffineTransform(translationX: 0, y: -20))
                .frame(width: 200, height: 200, alignment: .center)
            
            Path { path in
                path.move(to: CGPoint(x: 20, y: 20))
                path.addLine(to: CGPoint(x: 200, y: 20))
            }
            // dash 控制虚线，绘制5像素空5像素再绘制5像素如此重复
            .stroke(style: StrokeStyle(lineWidth: 10, dash: [5]))
            .foregroundColor(Color(UIColor.blue))
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            
            Spacer()
        }
    }
}

struct SU_Shape_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SU_Shape()
        }
    }
}
