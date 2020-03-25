//
//  SU_RadialGradient.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/16.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_RadialGradient: View {
    
    let gradient = Gradient(colors: [.red, .yellow, .green, .blue])
    
    var body: some View {
        Circle()
            .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 0, endRadius: 100))
            .frame(width: 200, height: 200, alignment: .center)
        
    }
}

struct SU_RadialGradient_Previews: PreviewProvider {
    static var previews: some View {
        SU_RadialGradient()
    }
}
