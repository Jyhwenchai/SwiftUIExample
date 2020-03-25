//
//  SU_Path.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/16.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Path: View {
    var body: some View {
        HStack {
            VStack {
                pathWithRect()
                pathWithEllipse()
                pathWithRoundedRect()
                pathWithRoundedRect2()
                pathWithClosure()
                //            exampleString()
            }
            
            VStack {
                pathWithArc()
                pathWithArc2()
                pathWithCurve()
                pathWithQuadCurve()
            }
        }
    }
    
    func pathWithRect() -> some View {
        Path(CGRect(x: 0, y: 0, width: 100, height: 100))
            .fill(Color.blue)
    }
    
    func exampleString() -> some View {
        Path("Hello, World!")!
            .fill(Color.red)
    }
    
    func pathWithEllipse() -> some View {
        Path(ellipseIn: CGRect(x: 0, y: 0, width: 200, height: 100))
            .fill(Color.blue)
    }
    
    func pathWithRoundedRect() -> some View {
        Path(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 100), cornerRadius: 20)
            .fill(Color.blue)
    }
    
    func pathWithRoundedRect2() -> some View {
        Path(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 100), cornerSize: CGSize(width: 20, height: 50))
            .fill(Color.blue)
    }
    
    func pathWithClosure() -> some View {
        Path { path in
            path.move(to: CGPoint(x: 50, y: 50))
            path.addLine(to: CGPoint(x: 150, y: 50))
            path.addLine(to: CGPoint(x: 150, y: 150))
            path.addLine(to: CGPoint(x: 50, y: 150))
            path.closeSubpath()
        }
        .stroke(Color.green, lineWidth: 10)
        
//        .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))

    }
    
    ////////
    
    func pathWithArc() -> some View {
        Path {
            $0.addArc(center: CGPoint(x: 100, y: 50), radius: 50, startAngle: .zero, endAngle: Angle(degrees: 360), clockwise: true)
        }.stroke(Color.blue, lineWidth: 10)
    }
    
    func pathWithArc2() -> some View {
        Path {
            $0.move(to: CGPoint(x: 0, y: 0))
            $0.addArc(tangent1End: CGPoint(x: 0, y: 50), tangent2End: CGPoint(x: 100, y: 100), radius: 50)
    
            $0.move(to: CGPoint(x: 0, y: 50))
            $0.addLine(to: CGPoint(x: 100, y: 50))
            
            $0.move(to: CGPoint(x: 100, y: 100))
            $0.addLine(to: CGPoint(x: 100, y: 0))
        }
        
        .stroke(Color.blue, lineWidth: 10)
    }
    
    func pathWithCurve() -> some View {
        Path {
            $0.move(to: CGPoint(x: 0, y: 50))
            $0.addCurve(to: CGPoint(x: 120, y: 50), control1: CGPoint(x: 30, y: -50), control2: CGPoint(x: 90, y: 150))
        }.stroke(Color.blue, lineWidth: 10)
    }
    
    func pathWithQuadCurve() -> some View {
        Path {
            $0.move(to: CGPoint(x: 0, y: 50))
            $0.addQuadCurve(to: CGPoint(x: 150, y: 50), control: CGPoint(x: 75, y: 150))
        }.stroke(Color.blue, lineWidth: 10)
    }
}


struct SU_Path_Previews: PreviewProvider {
    static var previews: some View {
        SU_Path()
    }
}
