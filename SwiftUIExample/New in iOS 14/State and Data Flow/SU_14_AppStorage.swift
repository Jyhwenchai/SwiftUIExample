//
//  SU_14_AppStorage.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2022/1/18.
//  Copyright © 2022 蔡志文. All rights reserved.
//

import SwiftUI

// `AppStorage` 使用 `UserDefaults` 来持久化应用信息。你可以使用将应用信息保存到本地。

struct SU_14_AppStorage: View {
    
    @AppStorage("UserName") var username: String = ""
    @AppStorage("Email") var email: String = ""
    @AppStorage("NotificationOpenState") var notificationOpenState: Bool = false
    
    var body: some View {
        Form {
            Section {
                TextField("user name", text: $username)
                TextField("email", text: $email)
                Toggle("Open Notitication", isOn: $notificationOpenState)
            }
            
            Section {
                ZStack {
                    HStack {
                        Spacer()
                        Button("Reset Data") {
                            reset()
                            print("button action")
                        }
                        .foregroundColor(Color.white)
                        .font(.body.bold())
                        Spacer()
                    }
                }
            }
            .listRowBackground(Color.orange)
        }
    }
    
    func reset() {
        username = ""
        email = ""
        notificationOpenState = false
    }
}

struct SU_14_AppStorage_Previews: PreviewProvider {
    static var previews: some View {
        SU_14_AppStorage()
    }
}
