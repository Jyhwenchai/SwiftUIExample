//
//  SU_TupleView.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 通过元组来初始化一组视图
 */
struct SU_TupleView: View {
    var body: some View {
        VStack {
            TupleView((
                Text("Hello World!"),
                Button(action: {}) {
                    Text("Button")
                },
                Image(systemName: "arrow.up.right.video.fill")
                .fixedSize()
                    .scaleEffect(1.5)
                .frame(width: 60, height: 60)
            ))
        }
    }
}

struct SU_TupleView_Previews: PreviewProvider {
    static var previews: some View {
        SU_TupleView()
    }
}
