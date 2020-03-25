//
//  SU_Gradient.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/13.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_LinearGradient: View {
    let gradient = LinearGradient(gradient: Gradient(colors: [.red, .yellow, .blue]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        Circle()
            .fill(Color.gray)
            .background(gradient)
            .frame(width: 200, height: 200, alignment: .center)
    }
}

struct SU_Gradient_Previews: PreviewProvider {
    static var previews: some View {
        SU_LinearGradient()
    }
}
