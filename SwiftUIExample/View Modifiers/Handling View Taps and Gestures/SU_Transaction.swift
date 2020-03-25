//
//  SU_Transaction.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 `func transaction(_ transform: @escaping (inout Transaction) -> Void) -> some View`
 
 为视图添加事务。将视图的转换变化应用于该视图中使用所有事务的视图，你可以借此完成一些动画效果。
 */
struct SU_Transaction: View {
    @State var scale = false
    var body: some View {
        VStack {
            Circle()
                .fill(Color.green)
                .frame(width: scale ? 200 : 100, height: scale ? 200 : 100)
                .transaction { t in
                    t.animation = .spring()
                }
            
            Button(action: {
                self.scale.toggle()
            }) {
                Text("Click Me")
            }
        }
    }
}

struct SU_Transaction_Previews: PreviewProvider {
    static var previews: some View {
        SU_Transaction()
    }
}
