//
//  SU_DrawingGroup.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func drawingGroup(opaque: Bool = false, colorMode: ColorRenderingMode = .nonLinear) -> some View`
 
 在最终显示之前，将视图内容合成为屏幕外图像。(在特定情况下对于性能有很好的的优化)
 
 `opaque` 指示图像是否不透明。如果为true，则图像的 Alpha 通道必须为1。
 `colorMode` 为图像的工作色彩空间和存储格式
 
 > 你可以在这篇文章看到更多的说明
 > https://www.hackingwithswift.com/books/ios-swiftui/enabling-high-performance-metal-rendering-with-drawinggroup
 */
struct SU_DrawingGroup: View {
    @State private var colorCycle = 0.0
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: self.colorCycle)
                .frame(width: 300, height: 300)

            Slider(value: $colorCycle)
        }
    }
}

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                    self.color(for: value, brightness: 1),
                    self.color(for: value, brightness: 0.5)
                ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
//                    .strokeBorder(self.color(for: value, brightness: 1), lineWidth: 2)
                
            }
        }
        .drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct SU_DrawingGroup_Previews: PreviewProvider {
    static var previews: some View {
        SU_DrawingGroup()
    }
}
