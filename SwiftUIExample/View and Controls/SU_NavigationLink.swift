//
//  SU_NavigationLink.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/11.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_NavigationLink: View {
    
    @State var isActive: Bool = true
    
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                if row % 2 == 0 {
                    NavigationLink(destination: Text("Go to List Detail Page")) {
                        Text("Row \(row)").background(Color.green)
                    }
                } else if row % 3 == 0 {
                    NavigationLink("Row \(row)") {
                        Text("Page \(row)")
                    }
                } else {
//                    NavigationLink(isActive: $isActive) {
//                        Text("Detail Page \(row)")
//                    } label: {
                        Text("Row \(row)").foregroundColor(.orange)
//                    }
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
