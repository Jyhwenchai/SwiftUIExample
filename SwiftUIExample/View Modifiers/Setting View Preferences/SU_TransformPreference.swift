//
//  SU_TransformPreference.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_TransformPreference: View {

    @State var selectedIndex = 0
    @State var rects: [CGRect] = [CGRect](repeating: CGRect.zero, count: 3)

    var body: some View {
        ZStack(alignment: .topLeading) {

            RoundedRectangle(cornerRadius: 10)
                .fill(Color.green)
                .offset(x: rects[selectedIndex].minX, y: rects[selectedIndex].minY)
                .frame(width: rects[selectedIndex].size.width, height: rects[selectedIndex].size.height)
                .animation(.easeInOut(duration: 0.5))

            VStack(spacing: 20) {
                ItemView(selectedIndex: $selectedIndex, text: "Item 1", idx: 0)
                ItemView(selectedIndex: $selectedIndex, text: "Item 2", idx: 1)
                ItemView(selectedIndex: $selectedIndex, text: "Item 3", idx: 2)
            }
            .onPreferenceChange(ItemPreferenceKey.self) { value in
                for item in value {
                    self.rects[item.idx] = CGRect(origin: item.topLeading, size: item.size)
                }
            }
        }
        .coordinateSpace(name: "itemFrame")
    }
    
    struct ItemPreferenceKey: PreferenceKey {
        
        typealias Value = [ItemPreferenceData]
        
        static var defaultValue: [ItemPreferenceData] = []
        
        static func reduce(value: inout [ItemPreferenceData], nextValue: () -> [ItemPreferenceData]) {
            value.append(contentsOf: nextValue())
        }
    }

    struct ItemPreferenceData: Equatable {
        var idx: Int
        var topLeading: CGPoint = .zero
        var size: CGSize = .zero
    }
    
    struct ItemView: View {
        @Binding var selectedIndex: Int
        let text: String
        let idx: Int
        
        var body: some View {
            Text(text)
                .padding(10)
                .background(ItemViewGeometry(idx: idx))
                .onTapGesture {
                    self.selectedIndex = self.idx
            }
        }
    }

    struct ItemViewGeometry: View {
        let idx: Int
        
        var body: some View {
            GeometryReader { geometry in
                Rectangle()
                    .fill(Color.clear)
                    .preference(key: ItemPreferenceKey.self, value: [ItemPreferenceData(idx: self.idx, topLeading: self.getFrame(geometry).origin)])
                    .transformPreference(ItemPreferenceKey.self, { ( value: inout [ItemPreferenceData]) in
                        value[0].size = self.getFrame(geometry).size
                    })
            }
        }
        
        func getFrame(_ geometry: GeometryProxy) -> CGRect {
            geometry.frame(in: CoordinateSpace.named("itemFrame"))
        }
    }
}


struct SU_TransformPreference_Previews: PreviewProvider {
    static var previews: some View {
        SU_TransformPreference()
    }
}
