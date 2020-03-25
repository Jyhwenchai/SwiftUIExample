//
//  SU_NavigationBarHidden.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_NavigationBarHidden: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<100) {
                    Text("Row \($0)")
                }
            }
            .navigationBarTitle("List")
            .navigationBarHidden(true)
        }
    }
}

struct SU_NavigationBarHidden_Previews: PreviewProvider {
    static var previews: some View {
        SU_NavigationBarHidden()
    }
}
