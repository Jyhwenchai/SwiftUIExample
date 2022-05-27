//
//  ContentView.swift
//  async_await_firebase
//
//  Created by 蔡志文 on 2022/4/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ContentView: View {
    
    @State var users: [User] = []
    @State var errorMsg = ""
    @State var showError: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    HStack(spacing: 15) {
                        AsyncImage(url: URL(string: user.imageURL)) { phase in
                            if let image = phase.image {
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(12)
                            } else {
                                ProgressView()
                                    .frame(maxHeight: .infinity, alignment: .center)
                            }
                        }
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text(user.userName)
                            .font(.title2.bold())
                        Text("Apple Sheep")
                    }
                }
            }
            .navigationBarTitle("async/await")
            .refreshable {
                await fetchData(email: "ilosic@qq.com", password: "123456")
            }
            .alert(errorMsg, isPresented: $showError) {
                Button("Close", role: .cancel) {
                    
                }
            }
        }
    }
    
    func fetchData(email: String, password: String) async {
        do {
            let authRequest = try await Auth.auth().signIn(withEmail: email, password: password)
            let userID = authRequest.user.uid
            let doc = try await Firestore.firestore().collection("users").document(userID).getDocument().data(as: User.self)
            guard let userData = doc else {
                throw DatabaseError.failed
            }
            self.users = [userData]
        } catch {
            errorMsg = error.localizedDescription
            showError.toggle()
        }
    }
    
//    func authUser(email: String, password: String, completion: @escaping (Result<String, AuthError>) -> ()) {
//        Auth.auth().signIn(withEmail: email, password: password) { result, err in
//            if let _ = err {
//                completion(.failure(.failedToLogin))
//                return
//            }
//
//            guard let user = result else {
//                completion(.failure(.failedToLogin))
//                return
//            }
//
//            completion(.success(user.user.uid))
//        }
//    }
//
//    func fetchData() {
//        authUser(email: "ilosic@qq.com", password: "123456") { result in
//            switch result {
//            case .success(let userID):
//                fetchUserData(userID: userID) { result in
//                    switch result {
//                    case .success(let users):
//                        self.users = users
//                    case .failure(let error):
//                        errorMsg = error.rawValue
//                        showError.toggle()
//                    }
//                }
//
//            case .failure(let error):
//                errorMsg = error.rawValue
//                showError.toggle()
//            }
//        }
//    }
//
//    func fetchUserData(userID: String, completion: @escaping (Result<[User], DatabaseError>) -> Void) {
//        Firestore.firestore().collection("users").document(userID).getDocument { snap, err in
//            if let _ = err {
//                completion(.failure(.failed))
//                return
//            }
//
//            guard let userData = try? snap?.data(as: User.self) else {
//                print("hello")
//                completion(.failure(.failed))
//                return
//            }
//
//            completion(.success([userData]))
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct User: Identifiable, Codable {
    var id = UUID().uuidString
    var imageURL: String
    var userName: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL
        case userName
    }
}

enum DatabaseError: String, Error {
    case failed = "Failed to Fetch From Database"
}

enum AuthError: String, Error {
    case failedToLogin = "Failed to Login"
}
