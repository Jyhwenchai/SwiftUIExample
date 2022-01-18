//
//  SU_14_SceneStorage.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2022/1/18.
//  Copyright © 2022 蔡志文. All rights reserved.
//

import SwiftUI

// 与 `SceneStorage` 类似 `AppStorage` 都可以用来持久化数据。不同的是 `SceneStorage` 可以使不同的 Scene 有不同的数据存储即有各自的一份存储，而 `AppStorage` 只有一份存储，如果你的应用有多个 Scene 那么 Scene 间的数据是共享的。
struct SU_14_SceneStorage: View {
    
    // 修改为 `AppStorage` 允许在 iPad OS 系统下使用分屏进行比较
    @SceneStorage("cachedText") var text = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $text)
        }
        .navigationViewStyle(.stack)
    }
}

struct SU_14_SceneStorage_Previews: PreviewProvider {
    static var previews: some View {
        SU_14_SceneStorage()
    }
}
