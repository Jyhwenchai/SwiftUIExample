//
//  SU_Capsule.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/13.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Capsule: View {
    var body: some View {
        Capsule()
            .fill(Color.blue)
            .frame(width: 200, height: 130)
    }
}

struct SU_Capsule_Previews: PreviewProvider {
    static var previews: some View {
        SU_Capsule()
    }
}
