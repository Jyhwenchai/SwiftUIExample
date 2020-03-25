//
//  SU_ListRowInsets.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_ListRowInsets: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<100) {
                    Text("Row \($0)")
                }
                .listRowInsets(.init(top: 20, leading: 20, bottom: 20, trailing: 20))
            }
            .navigationBarTitle("List")
        }
    }
}

struct SU_ListRowInsets_Previews: PreviewProvider {
    static var previews: some View {
        SU_ListRowInsets()
    }
}
