//
//  US_EditButton.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/11.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 用于 List 中切换编辑模式
 */
struct US_EditButton: View {
    
   @State private var users = ["user1", "user2", "user3", "user4"]

    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
                .onDelete(perform: delete)
                .onMove { (source, index) in
                    self.users.move(fromOffsets: source, toOffset: index)
                }
            }
            .navigationBarItems(trailing: EditButton())
        }
    }

    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}

struct US_EditButton_Previews: PreviewProvider {
    static var previews: some View {
        US_EditButton()
    }
}
