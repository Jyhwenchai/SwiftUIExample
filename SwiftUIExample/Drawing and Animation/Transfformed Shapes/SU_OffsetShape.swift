//
//  SU_OffsetShape.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/13.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_OffsetShape: View {
    var body: some View {
        OffsetShape(shape: Circle(), offset: CGSize(width: 50, height: 50))
            .fill(Color.blue)
        .frame(width: 200, height: 200)
    }
}

struct SU_OffsetShape_Previews: PreviewProvider {
    static var previews: some View {
        SU_OffsetShape()
    }
}
