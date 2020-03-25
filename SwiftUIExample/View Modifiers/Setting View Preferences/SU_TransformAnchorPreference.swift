//
//  SU_TransformAnchorPreference.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_TransformAnchorPreference: View {

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
        
        let topLeading = p?.topLeading != nil ? geometry[p!.topLeading!] : .zero
        let bottomTrailing = p?.bottomTrailing != nil ? geometry[p!.bottomTrailing!] : .zero
        
        return RoundedRectangle(cornerRadius: 10)
            .fill(Color.green)
            .frame(width: bottomTrailing.x - topLeading.x, height: bottomTrailing.y - topLeading.y)
            .fixedSize()
            .offset(x: topLeading.x, y: topLeading.y)
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
        var topLeading: Anchor<CGPoint>? = nil
        var bottomTrailing: Anchor<CGPoint>? = nil
    }
    
    struct ItemView: View {
        @Binding var selectedIndex: Int
        let text: String
        let idx: Int
        
        var body: some View {
            Text(text)
                .padding(10)
                .foregroundColor(Color.red)
                .anchorPreference(key: ItemPreferenceKey.self, value: .topLeading, transform: {
                    [ItemPreferenceData(idx: self.idx, topLeading: $0)]
                })
                // 这里不能使用两个 anchorPreference 进行处理，但我们可以在其基础上使用 transformAnchorPreference
                .transformAnchorPreference(key: ItemPreferenceKey.self, value: .bottomTrailing, transform: { (value: inout [ItemPreferenceData], anchor: Anchor<CGPoint>) in
                    value[0].bottomTrailing = anchor
                })
                .onTapGesture { self.selectedIndex = self.idx }
        }
    }

}

struct SU_TransformAnchorPreference_Previews: PreviewProvider {
    static var previews: some View {
        SU_TransformAnchorPreference()
    }
}
