//
//  SU_ListRowBackground.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_ListRowBackground: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<100) {
                    Text("Row \($0)")
                }
                .listRowBackground(Color.blue)
            }
            .navigationBarTitle("List")
        }
    }
}

struct SU_ListRowBackground_Previews: PreviewProvider {
    static var previews: some View {
        SU_ListRowBackground()
    }
}
