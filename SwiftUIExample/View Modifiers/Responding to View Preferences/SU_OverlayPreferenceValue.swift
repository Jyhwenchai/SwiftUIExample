//
//  SU_OverlayPreferenceValue.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func overlayPreferenceValue<Key, T>(_ key: Key.Type = Key.self, _ transform: @escaping (Key.Value) -> T) -> some View where Key : PreferenceKey, T : View`
 
 与 `backgroundPreferenceValue(_:_:)` 作用相同，唯一的区别是其作用的视图将显示在前面而不是后面
 */
struct SU_OverlayPreferenceValue: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct SU_OverlayPreferenceValue_Previews: PreviewProvider {
    static var previews: some View {
        SU_OverlayPreferenceValue()
    }
}
