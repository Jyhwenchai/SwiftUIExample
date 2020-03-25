//
//  SU_AnchorPreference.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func anchorPreference<A, K>(key _: K.Type = K.self, value: Anchor<A>.Source, transform: @escaping (Anchor<A>) -> K.Value) -> some View where K : PreferenceKey`
 
 在开始了解这个修改器前应该对 `preference(key:value:)` 有所了解，可以转自 `SU_Preference.swift` 查看示例
 
 > 你可以阅读这篇文章
 https://swiftui-lab.com/communicating-with-the-view-tree-part-2/
 */
struct SU_AnchorPreference: View {

    @State var selectedIndex = 0
    @State var rects: [CGRect] = [CGRect](repeating: CGRect.zero, count: 3)

    var body: some View {
        
        VStack(spacing: 20) {
            ItemView(selectedIndex: $selectedIndex, text: "Item 1", idx: 0)
            ItemView(selectedIndex: $selectedIndex, text: "Item 2", idx: 1)
            ItemView(selectedIndex: $selectedIndex, text: "Item 3", idx: 2)
        }
            
        .backgroundPreferenceValue(ItemPreferenceKey.self) { preferences in
            return GeometryReader { geo in
                self.createBackground(geo, preferences)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
    }
    
    func createBackground(_ geometry: GeometryProxy, _ preferences: [ItemPreferenceData]) -> some View {
        let p = preferences.first {  $0.idx == self.selectedIndex }
        
        let bounds = p != nil ? geometry[p!.rect] : .zero
        
        return RoundedRectangle(cornerRadius: 10)
            .fill(Color.green)
            .frame(width: bounds.width, height: bounds.height)
            .fixedSize()
            .offset(x: bounds.minX, y: bounds.minY)
            .animation(.easeInOut(duration: 0.5))
    }
    
    
    struct ItemPreferenceKey: PreferenceKey {
        
        typealias Value = [ItemPreferenceData]
        
        static var defaultValue: [ItemPreferenceData] = []
        
        static func reduce(value: inout [ItemPreferenceData], nextValue: () -> [ItemPreferenceData]) {
            value.append(contentsOf: nextValue())
        }
    }

    struct ItemPreferenceData {
        var idx: Int
        var rect: Anchor<CGRect>
    }
    
    struct ItemView: View {
        @Binding var selectedIndex: Int
        let text: String
        let idx: Int
        
        var body: some View {
            Text(text)
                .padding(10)
                .foregroundColor(Color.red)
                .anchorPreference(key: ItemPreferenceKey.self, value: .bounds, transform: {
                    [ItemPreferenceData(idx: self.idx, rect: $0)]
                })
                .onTapGesture { self.selectedIndex = self.idx }
        }
    }

}


struct SU_AnchorPreference_Previews: PreviewProvider {
    static var previews: some View {
        SU_AnchorPreference()
    }
}
