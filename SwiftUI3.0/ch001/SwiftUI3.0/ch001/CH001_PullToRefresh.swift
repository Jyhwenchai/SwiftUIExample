//
//  CH001_PullToRefresh.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/19.
//

import SwiftUI

struct CH001_PullToRefresh: View {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    @State private var users: [User] = []
    
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.name)
                        
                        Text(user.email)
                            .font(.caption)
                    }
                }
            }
            .refreshable(action: {
                await fetchUsers()
            })
            .navigationTitle("Pull to Refresh")
        }
    }
    
    private var filterUsers: [User] {
        users.filter {
            searchText.isEmpty
            ? true
            : $0.email.lowercased()
                .contains(searchText.lowercased())
        }
    }
    
    func fetchUsers() async {
        let session = URLSession(configuration: .default)
        do {
            let task = try await session.data(from: url)
            let users = try JSONDecoder().decode([User].self, from: task.0)
            self.users = users
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct CH001_PullToRefresh_Previews: PreviewProvider {
    static var previews: some View {
        CH001_PullToRefresh()
    }
}

private struct User: Identifiable {
    var id: Int
    var name: String
    var email: String
}

extension User: Codable {}
