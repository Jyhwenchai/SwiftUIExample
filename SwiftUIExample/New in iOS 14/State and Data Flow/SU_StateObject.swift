//
//  SU_StateObject.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/7/3.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// `@StateObject`
///
/// `@StateObject` 功能与 `@ObservedObject` 相同，不同的是 `@ObservedObject` 的生命周期不由当前视图所管理，所以在一些特殊的情况下会发生不可预料的结果，但是 `@StateObject` 的生命周期完全由当前的视图所掌控，所以更加安全。
struct SU_StateObject: View {
    
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            Text(user.name)
            TextField("username", text: $user.name)
                .padding(.horizontal, 10)
                .frame(width: 300, height: 44, alignment: .center)
                .border(Color.orange, width: 1)
        }
    }
}

struct SU_StateObject_Previews: PreviewProvider {
    static var previews: some View {
        SU_StateObject()
    }
}
