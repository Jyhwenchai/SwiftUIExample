//
//  SU_PreferenceDemo.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/24.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func preference<K>(key _: K.Type = K.self, value: K.Value) -> some View where K : PreferenceKey`
 
 通过此修改器我们可以为子视图附加一些信息，这些信息被包装在为叫做“首选项”的属性中，然后在视图层次结构中我们可以很容易的拿到这些首选项里的信息
 
 > 更具体的的讲解可以可以参考这篇文章
 https://swiftui-lab.com/communicating-with-the-view-tree-part-1/
 */
struct SU_Preference: View {

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
            // 通过此修改器我们可以监听 "首选项" 的变化
            .onPreferenceChange(ItemPreferenceKey.self) { value in
                for item in value {
                    self.rects[item.idx] = item.rect
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
        var rect: CGRect
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
                    .preference(key: ItemPreferenceKey.self,
                                value: [ItemPreferenceData(idx: self.idx, rect: geometry.frame(in: CoordinateSpace.named("itemFrame")))])

            }
        }
    }
}



struct SU_PreferenceDemo_Previews: PreviewProvider {
    static var previews: some View {
        SU_Preference()
    }
}


//struct SU_PreferenceDemo: View {
//
//    @State var selectedIndex = 0
//
//    var body: some View {
//        VStack(spacing: 20) {
//            ItemView(selectedIndex: $selectedIndex, text: "Item 1", idx: 0)
//            ItemView(selectedIndex: $selectedIndex, text: "Item 2", idx: 1)
//            ItemView(selectedIndex: $selectedIndex, text: "Item 3", idx: 2)
//        }
//    }
//}
//
//struct ItemView: View {
//    @Binding var selectedIndex: Int
//    var text: String
//    var idx: Int
//
//    var body: some View {
//        Text(text)
//            .padding(10)
//            .foregroundColor(Color.red)
//            .background(RoundedRectangle(cornerRadius: 10).fill(selectedIndex == idx ? Color.green : Color.clear))
//            .onTapGesture {
//                self.selectedIndex = self.idx
//            }
//        .animation(.easeInOut(duration: 0.5))
//    }
//}
//
//struct SU_PreferenceDemo_Previews: PreviewProvider {
//    static var previews: some View {
//        SU_PreferenceDemo()
//    }
//}
