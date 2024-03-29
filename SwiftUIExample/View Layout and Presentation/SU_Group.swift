//
//  SU_Group.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 由于在一些容器视图中（例如：Form、HStack、VStack、Section）最多只能放置10个视图，所以当你想要放置更多视图的时候你可以使用 Group 对视图进行分组，但实际上分组的视图与不分组时并没有什么区别。
 */

struct SU_Group: View {
    var body: some View {
        Form {
            Group {
                Text("SwiftUI")
                Text("Combine")
                Text("Swift System")
            }
            .font(.headline)
        }
    }
}


struct SU_Group_Previews: PreviewProvider {
    static var previews: some View {
        SU_Group()
    }
}
