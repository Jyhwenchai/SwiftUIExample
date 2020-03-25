//
//  SU_Ellipse.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/13.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Ellipse: View {
    var body: some View {
        Ellipse()
            .fill(Color.blue)
            .frame(width: 200, height: 150, alignment: .center)
    }
}

struct SU_Ellipse_Previews: PreviewProvider {
    static var previews: some View {
        SU_Ellipse()
    }
}
