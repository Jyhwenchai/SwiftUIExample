//
//  Home.swift
//  ch005_wave_animation
//
//  Created by 蔡志文 on 2022/4/27.
//

import SwiftUI

struct Home: View {
    
    @State var toggle = false
    
    var body: some View {
        ZStack {
            WaveForm(color: .purple.opacity(0.8), amplify: 150, isReversed: false)
//            WaveForm(color: (toggle ? Color.purple : Color.cyan).opacity(0.6), amplify: 140, isReversed: true)
            
            VStack {
                HStack {
                    Text("Wave's")
                        .font(.largeTitle.bold())
                    Spacer()
                    Toggle(isOn: $toggle) {
                        Image(systemName: "eyedropper.halffull")
                            .font(.title2)
                    }
                    .toggleStyle(.button)
                    .tint(.purple)
                }
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct WaveForm: View {
    
    var color: Color
    var amplify: CGFloat
    var isReversed: Bool
    
    var body: some View {
        TimelineView(.animation) { timeline in
            
            Canvas { context, size in
                let timeNow = timeline.date.timeIntervalSinceReferenceDate
                
                let angle = timeNow.remainder(dividingBy: 2)
                
                let offset = angle * size.width
                
                context.draw(Text("\(offset)"), at: CGPoint(x: size.width / 2, y: 100))
                
                
                
                context.translateBy(x: isReversed ? -offset : offset, y: 0)
                
                context.fill(
                    getPath(size: size),
                    with: .color(color))
                context.translateBy(x: -size.width, y: 0)
                context.fill(getPath(size: size), with: .color(color))
                context.translateBy(x: size.width * 2, y: 0)
                context.fill(getPath(size: size), with: .color(color))
            }
        }
    }
    
    func getPath(size: CGSize) -> Path {
        Path { path in
            
            let midHeight = size.height / 2
            
            let width = size.width
            
            path.move(to: CGPoint(x: 0, y: midHeight))
            
            path.addCurve(to: CGPoint(x: width, y: midHeight), control1: CGPoint(x: width * 0.4, y: midHeight + amplify), control2: CGPoint(x: width * 0.65, y: midHeight - amplify))
            
            path.addLine(to: CGPoint(x: width, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
            
        }
    }
}
