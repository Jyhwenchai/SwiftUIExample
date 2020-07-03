//
//  SU_Environment.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/7/3.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
/// `@Environment`
///
/// `@Environment` 专门用于预定义键
struct SU_Environment: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct SU_Environment_Previews: PreviewProvider {
    static var previews: some View {
        SU_Environment()
    }
}
