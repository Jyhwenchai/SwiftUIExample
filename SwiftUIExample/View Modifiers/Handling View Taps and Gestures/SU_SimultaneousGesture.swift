//
//  SU_SimultaneousGesture.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func simultaneousGesture<T>(_ gesture: T, including mask: GestureMask = .all) -> some View where T : Gesture`
 
 将手势附加到视图以与视图已存在的手势同时处理
 */
struct SU_SimultaneousGesture: View {
    
    @State var degrees = 0.0
    @State var scale: CGFloat = 1.0
    
     var body: some View {
        let scaleGesture = MagnificationGesture()
            .onChanged { value in
                scale = value.magnitude
            }
            .onEnded { _ in
                scale = 1.0
            }
        
        let rotationGesture = RotationGesture()
            .onChanged { value in
                degrees = value.degrees
            }
            .onEnded { _ in
                degrees = 0
            }
        
        let scaleAndRotateGesture = scaleGesture.simultaneously(with: rotationGesture)
        
        return Rectangle()
            .fill(Color.blue)
            .frame(width: 200, height: 150)
            .gesture(scaleAndRotateGesture)
            .rotationEffect(Angle(degrees: degrees)).scaleEffect(scale, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).animation(.easeIn)
        
    }
}

struct SU_SimultaneousGesture_Previews: PreviewProvider {
    static var previews: some View {
        SU_SimultaneousGesture()
    }
}
