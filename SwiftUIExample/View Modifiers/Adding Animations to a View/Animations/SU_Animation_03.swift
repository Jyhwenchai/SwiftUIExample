//
//  SU_Animation_03.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/26.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Animation_03: View {
    
    var body: some View {
    
        VStack(spacing: 20) {
            RingView(show: false)

            RingView2(show: false)
            
            RingView3(show: false)
        }
        
    }
    
}

struct SU_Animation_03_Previews: PreviewProvider {
    static var previews: some View {
        SU_Animation_03()
    }
}


struct RingView: View {
    var startColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    var endColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    var width: CGFloat = 100
    var height: CGFloat = 100
    var persent: CGFloat = 80
    
    @State var show: Bool
    
    var body: some View {
        
        let multiplier = width / 100
        let progress = 1 - persent / 100
        
        return ZStack {
            Circle()
                .stroke(Color.black.opacity((0.1)), lineWidth: 10 * multiplier)
                .frame(width: width * multiplier, height: height * multiplier)
            
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(startColor), Color(endColor)]), startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: width * multiplier, height: height * multiplier)
                .rotationEffect(.degrees(90))   // 绕z轴旋转，使起点位于底部
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))  // 水平翻转，翻转后动画方向相反，起点位于顶部
                .shadow(color: Color(endColor).opacity(0.3), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
                .rotationEffect(.degrees(360))
                .animation(.easeInOut(duration: 0.4))
            Text("\(Int(persent))%")
                .font(.system(size: 30, weight: .bold))
            
            Button(action: { self.show.toggle() }) {
                Text("Animate")
            }
            .offset(x: 0, y: 20)
        }
    }
}


struct RingView2: View {
    var startColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    var endColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    var width: CGFloat = 100
    var height: CGFloat = 100
    var lineWidth: CGFloat = 10
    var persent: CGFloat = 80
    @State private var startPersent: CGFloat = 1.0
    @State private  var endPersent: CGFloat = 0.8
    
    @State var show: Bool
    
    var body: some View {
        
        let multiplier = width / 100

        return ZStack {
            Circle()
                .stroke(Color.black.opacity((0.1)), lineWidth: lineWidth)
                .frame(width: width, height: height)

            Circle()
                .trim(from: endPersent, to: startPersent)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(startColor), Color(endColor)]), startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: width, height: height)
                .rotationEffect(.degrees(90))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .shadow(color: Color(endColor).opacity(0.3), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
                .rotationEffect(.degrees( show ? 360 : 0))
                .animation(
                    Animation.easeInOut(duration: 1.5)
                        .repeatCount(Int.max, autoreverses: false)
                )
            
            Button(action: { self.show.toggle() }, label: {
                Text("Animate")
            })

        }
    }
}


struct RingView3: View {
    var startColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    var endColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    var width: CGFloat = 100
    var height: CGFloat = 100
    var lineWidth: CGFloat = 10
    var persent: CGFloat = 80
    @State private var startPersent: CGFloat = 1.0
    @State private  var endPersent: CGFloat = 1.0
    
    @State var show: Bool
    
    var body: some View {
        
        let multiplier = width / 100

        return ZStack {
            Circle()
                .stroke(Color.black.opacity((0.1)), lineWidth: lineWidth)
                .frame(width: width, height: height)

            Circle()
                .trim(from: show ? 0 : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(startColor), Color(endColor)]), startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: width, height: height)
                .rotationEffect(.degrees(90))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .shadow(color: Color(endColor).opacity(0.3), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
                .rotationEffect(.degrees( show ? 360 : 0))
                .animation(
                    Animation.easeInOut(duration: 1.5)
                    .repeatCount(Int.max, autoreverses: false)
                )
                        
            Button(action: { self.show.toggle() }, label: {
                Text("Animate")
            })

        }
    }
}
