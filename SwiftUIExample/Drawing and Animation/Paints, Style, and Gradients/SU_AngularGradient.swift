//
//  SU_AngularGradient.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/13.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_AngularGradient: View {
    
    var body: some View {
        createAngularGradient()
    }
    
    func createAngularGradient() -> some View {
        let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red])
        let conic = AngularGradient(gradient: colors, center: .center)
        return Circle()
                .fill(conic)
                .frame(width: 200, height: 200)
    }
}

struct SU_AngularGradient_Previews: PreviewProvider {
    static var previews: some View {
        SU_AngularGradient()
    }
}
