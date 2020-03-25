//
//  SU_NavigationView.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_NavigationView: View {
    
    private var addButton: some View {
          AnyView(Button(action: {}) {
              Image(systemName: "plus")
         })
      }
    
    var body: some View {
        NavigationView {
            List(0..<100) {
                Text("Row \($0)")
            }
            .navigationBarTitle("NavigationBar Title")
            .navigationBarHidden(false)
            .navigationBarItems(leading: EditButton(), trailing: addButton)
        }
    }
}

struct SU_NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SU_NavigationView()
    }
}
