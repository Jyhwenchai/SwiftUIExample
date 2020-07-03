//
//  SU_RotationGesture.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/7/3.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_RotationGesture: View {
    @State var angle = Angle(degrees: 0.0)
    
    var rotation: some Gesture {
        RotationGesture()
            .onChanged { angle in
                self.angle = angle
            }
    }
    
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: 200, height: 200, alignment: .center)
            .rotationEffect(self.angle)
            .gesture(rotation)
    }
}

struct SU_RotationGesture_Previews: PreviewProvider {
    static var previews: some View {
        SU_RotationGesture()
    }
}
