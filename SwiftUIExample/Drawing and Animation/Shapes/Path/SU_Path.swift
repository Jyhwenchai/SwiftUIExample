//
//  SU_Path.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/16.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Path: View {
    
    let titles: [String] = [
        "Draw Rect Path",
        "Draw Ellipse Path",
        "Draw RoundedRect Path",
        "Draw RoundedRect Path 2",
        "Draw Closure Path",
        "Draw String Path",
        "Draw Arc",
        "Draw Arc 2",
        "Draw Curve",
        "Draw Quad Curve",
    ]
    
    let views: [AnyView] = [
        pathWithRect(),
        pathWithEllipse(),
        pathWithRoundedRect(),
        pathWithRoundedRect2(),
        pathWithClosure(),
        pathWithString(),
        pathWithArc(),
        pathWithArc2(),
        pathWithCurve(),
        pathWithQuadCurve(),
    ]

    var body: some View {
        
        NavigationView {
            List {
                ForEach(titles.indices) { index in
                    NavigationLink(titles[index]) {
                        views[index]
                    }
                }
                
            }
        }
        .navigationTitle("Path")
    }
    
    static func pathWithRect() -> AnyView {
        let view = Path(CGRect(x: 100, y: 100, width: 100, height: 100))
            .fill(Color.blue)
        return AnyView(view)
    }
    
    static func pathWithString() -> AnyView {
        guard let path = Path("1234567890") else { return AnyView(Text("Path Draw Error")) }
        let view = path.stroke(Color.green, lineWidth: 2).frame(width: 200, height: 30, alignment: .center)
        return AnyView(view)
    }
    
    static func pathWithEllipse() -> AnyView {
        let view = Path(ellipseIn: CGRect(x: 0, y: 0, width: 200, height: 100))
            .fill(Color.blue)
        return AnyView(view)
    }
    
    static func pathWithRoundedRect() -> AnyView {
        let view = Path(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 100), cornerRadius: 20)
            .fill(Color.blue)
        return AnyView(view)
    }
    
    static func pathWithRoundedRect2() -> AnyView {
        let view = Path(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 100), cornerSize: CGSize(width: 20, height: 50))
            .fill(Color.blue)
        return AnyView(view)
    }
    
    static func pathWithClosure() -> AnyView {
        let view = Path { path in
            path.move(to: CGPoint(x: 50, y: 50))
            path.addLine(to: CGPoint(x: 150, y: 50))
            path.addLine(to: CGPoint(x: 150, y: 150))
            path.addLine(to: CGPoint(x: 50, y: 150))
            path.closeSubpath()
        }
        .stroke(Color.green, lineWidth: 10)
        
//        .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))

       return AnyView(view)
        
    }
    
    static func pathWithArc() -> AnyView {
        let view = Path {
            $0.addArc(center: CGPoint(x: 100, y: 50), radius: 50, startAngle: .zero, endAngle: Angle(degrees: 360), clockwise: true)
        }.stroke(Color.blue, lineWidth: 10)
        
        return AnyView(view)
    }
    
    static func pathWithArc2() -> AnyView {
        let view = Path {
            $0.move(to: CGPoint(x: 0, y: 0))
            $0.addArc(tangent1End: CGPoint(x: 0, y: 50), tangent2End: CGPoint(x: 100, y: 100), radius: 50)
    
            $0.move(to: CGPoint(x: 0, y: 50))
            $0.addLine(to: CGPoint(x: 100, y: 50))
            
            $0.move(to: CGPoint(x: 100, y: 100))
            $0.addLine(to: CGPoint(x: 100, y: 0))
        }
        .stroke(Color.blue, lineWidth: 10)
        return AnyView(view)
    }
    
    static func pathWithCurve() -> AnyView {
        let view = Path {
            $0.move(to: CGPoint(x: 0, y: 50))
            $0.addCurve(to: CGPoint(x: 120, y: 50), control1: CGPoint(x: 30, y: -50), control2: CGPoint(x: 90, y: 150))
        }.stroke(Color.blue, lineWidth: 10)
        return AnyView(view)
    }
    
    static func pathWithQuadCurve() -> AnyView {
        let view = Path {
            $0.move(to: CGPoint(x: 0, y: 50))
            $0.addQuadCurve(to: CGPoint(x: 150, y: 50), control: CGPoint(x: 75, y: 150))
        }.stroke(Color.blue, lineWidth: 10)
        return AnyView(view)
    }
}


struct SU_Path_Previews: PreviewProvider {
    static var previews: some View {
        SU_Path()
    }
}
