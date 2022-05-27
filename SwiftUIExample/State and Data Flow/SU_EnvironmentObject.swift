//
//  SU_EnvironmentObject.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/7/3.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// `@EnvironmentObject`
///
/// `@EnvironmentObject` 的作用与 `@ObservedObject` 类似都是为了保持数据与视图的状态的同步，不同的是 `@EnvironmentObject` 可以跨越多个视图层级进行使用，例如 A 视图有个对象需要通过 B、C、D 最终到达 E 视图进行使用，但是 B、C、D 本身并没用使用到该对象，这时候我们可以使用 `@EnvironmentObject` 在 E 视图中就可以直接同步 A 中的对象而不需要经过 B、C、D 的传递。
struct SU_EnvironmentObject: View {
    
    let user = SU_User()
    
    var body: some View {
        VStack {
            SU_ShowUserView().environmentObject(user)
            SU_EditView().environmentObject(user)
                .padding(.horizontal, 10)
                .frame(width: 300, height: 44, alignment: .center)
                .border(Color.orange, width: 1)
        }
    }
}

private struct SU_EditView: View {
    @EnvironmentObject var user: SU_User
    
    var body: some View {
        TextField("username", text: $user.name)
    }
}

private struct SU_ShowUserView: View {
    @EnvironmentObject var user: SU_User
    
    var body: some View {
        Text(user.name)
    }
}

struct SU_EnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        SU_EnvironmentObject()
    }
}
