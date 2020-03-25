//
//  SU_ScrollView.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_ScrollView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(1..<100) {
                Text("Item \($0)")
            }
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height,
                   alignment: .leading)
        }
    }
}

struct SU_ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SU_ScrollView()
    }
}
