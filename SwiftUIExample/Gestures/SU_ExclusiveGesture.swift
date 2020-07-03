//
//  SU_ ExclusiveGesture.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/7/3.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// `ExclusiveGesture`
///
/// 由两个手势组成的手势，使其中只有一个可以成功。
struct SU_ExclusiveGesture: View {
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
        
//        let enableGesture = scaleGesture.exclusively(before: rotationGesture)
        let enableGesture = rotationGesture.exclusively(before: scaleGesture)
        
        return Rectangle()
            .fill(Color.blue)
            .frame(width: 200, height: 150)
            .gesture(enableGesture)
            .rotationEffect(Angle(degrees: degrees)).scaleEffect(scale, anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).animation(.easeIn)
        
    }
}

struct SU_ExclusiveGesture_Previews: PreviewProvider {
    static var previews: some View {
        SU_ExclusiveGesture()
    }
}
