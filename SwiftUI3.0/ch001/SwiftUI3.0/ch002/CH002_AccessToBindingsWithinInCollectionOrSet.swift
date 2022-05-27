//
//  CH002AccessToBindingsWithinInCollectionOrSet.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/21.
//

import SwiftUI

struct CH002_AccessToBindingsWithinInCollectionOrSet: View {
    
    @State private var users: [User] = [
        User(username: "iJustine"),
        User(username: "Tim Cook"),
        User(username: "Steve"),
        User(username: "Bill"),
    ]
    var body: some View {
        List {
            // 通过在集合类型加 $ 前缀可以很容易的获得 Binding
            ForEach($users) { $user in
                TextField("Edit Name", text: $user.username)
            }
        }
    }
}

private struct User: Identifiable {
    var id = UUID().uuidString
    var username: String
}

struct CH002_AccessToBindingsWithinInCollectionOrSet_Previews: PreviewProvider {
    static var previews: some View {
        CH002_AccessToBindingsWithinInCollectionOrSet()
    }
}
