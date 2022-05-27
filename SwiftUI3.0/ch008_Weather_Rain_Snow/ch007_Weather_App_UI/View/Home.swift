//
//  Home.swift
//  ch007_Weather_App_UI
//
//  Created by 蔡志文 on 2022/5/7.
//

import SwiftUI
import SpriteKit

struct Home: View {
    
    @State var offset: CGFloat = 0
    var topEdge: CGFloat
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
               Image("sky")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)
            
            // Rain Fall view
            // to avoid bug
            GeometryReader { _ in
                SpriteView(scene: RainFall(), options: [.allowsTransparency])
            }
            .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack(alignment: .center, spacing: 5) {
                        Text("San Jose")
                            .font(.system(size: 35))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                        Text(" 98°")
                            .font(.system(size: 45))
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                        Text("Cloudy")
                            .foregroundStyle(.secondary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                        Text("H:103°L:105°")
                            .foregroundStyle(.primary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                    }
                    .offset(y: -offset)
                    .offset(y: offset > 0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)
                    .offset(y: getTitleOffset())
                    
                    // Custom Data View
                    VStack(spacing: 8) {
                        CustomStackView {
                            Label {
                                Text("Hourly Forecast")
                            } icon: {
                                Image(systemName: "clock")
                            }
                            
                        } contentView: {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForecaseView(time: "12 PM", celcius: 94, image: "sun.min")
                                    ForecaseView(time: "1 PM", celcius: 95, image: "sun.haze")
                                    ForecaseView(time: "2 PM", celcius: 96, image: "sun.min")
                                    ForecaseView(time: "3 PM", celcius: 97, image: "cloud.sun")
                                    ForecaseView(time: "4 PM", celcius: 99, image: "sun.haze")
                                }
                            }
                        }
                    }
                    .overlay(
                        GeometryReader { _ in
                            SpriteView(scene: RainFallLanding(), options: [.allowsTransparency])
                                .offset(y: -10)
                        }
                    )
                    .padding(.top, 20)
                    
                    WeatherDataView()
                }
                .padding(.top, 75)
                .padding([.horizontal, .bottom])
                
                .overlay(
                    GeometryReader { proxy -> Color in
                        let minY = proxy.frame(in: .global).minY
                        DispatchQueue.main.async {
                            self.offset = minY
                        }
                        return Color.clear
                    }
                )
            }
        }
    }
    
    func getTitleOpacity() -> CGFloat {
        let titleOffset = -getTitleOffset()
        let progress = titleOffset / 20
        let opacity = 1 - progress
        return opacity
    }
    
    
    func getTitleOffset() -> CGFloat {
        if offset < 0 {
            let progress = -offset / 120
            let newOffset = (progress <= 1.0 ? progress : 1) * 20
            return -newOffset
        }
        return 0
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ForecaseView: View {
    var time: String
    var celcius: CGFloat
    var image: String
    
    var body: some View {
        VStack(spacing: 15) {
            Text(time)
                .font(.callout.bold())
                .foregroundStyle(.white)
            Image(systemName: image)
                .font(.title2)
                .symbolVariant(.fill)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.yellow, .white)
                .frame(height: 30)
            
            Text("\(Int(celcius))°")
                .font(.callout.bold())
                .foregroundStyle(.white)
        }
        .padding(.horizontal, 10)
    }
}

// Rain/Snow Effect
class RainFall: SKScene {
    
    override func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .aspectFill
        anchorPoint = CGPoint(x: 0.5, y: 1)
        backgroundColor = .clear
        let node = SKEmitterNode(fileNamed: "RainFall.sks")!
        addChild(node)
        
        // Full width
        node.particlePositionRange.dx = UIScreen.main.bounds.width
    }
}

// Next Rain Fall Landing Scene...
class RainFallLanding: SKScene {
    
    override func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .aspectFill
        let height = size.height
        
        anchorPoint = CGPoint(x: 0.5, y: (height - 5) / height)
        backgroundColor = .clear
        let node = SKEmitterNode(fileNamed: "RainFallLanding.sks")!
        addChild(node)
        
        // Full width
        node.particlePositionRange.dx = UIScreen.main.bounds.width - 30
    }
}
