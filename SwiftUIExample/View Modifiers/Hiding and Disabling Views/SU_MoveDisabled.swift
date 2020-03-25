//
//  SU_MoveDisabled.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 禁用移动功能
 */
struct SU_MoveDisabled: View {
    @State private var users = ["user1", "user2", "user3", "user4"]

    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                    .moveDisabled(user == "user2")
                }
                .onMove { (source, index) in
                    self.users.move(fromOffsets: source, toOffset: index)
                }
            }
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct SU_MoveDisabled_Previews: PreviewProvider {
    static var previews: some View {
        SU_MoveDisabled()
    }
}
