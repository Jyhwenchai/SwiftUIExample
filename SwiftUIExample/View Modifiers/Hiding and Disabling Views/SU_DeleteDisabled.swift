//
//  SU_DeleteDisabled.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 禁用删除功能
 */
struct SU_DeleteDisabled: View {
    @State private var users = ["user1", "user2", "user3", "user4"]

    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                        .deleteDisabled(user == "user2")
                }
                .onDelete(perform: delete)
            }
            .navigationBarItems(trailing: EditButton())
        }
    }

    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}

struct SU_DeleteDisabled_Previews: PreviewProvider {
    static var previews: some View {
        SU_DeleteDisabled()
    }
}
