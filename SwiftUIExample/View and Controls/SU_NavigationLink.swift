//
//  SU_NavigationLink.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/11.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_NavigationLink: View {
    var body: some View {
        NavigationView {
//                NavigationLink(destination: Text("Go to New Page")) {
//                    Text("New Page")
//                }
            List(0..<100) { row in
                NavigationLink(destination: Text("Go to List Detail Page")) {
                    Text("Page \(row)")
                }
            }
            .navigationBarTitle("List")
        }
        
    }
}

struct SU_NavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        SU_NavigationLink()
    }
}
