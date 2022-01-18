//
//  SU_15_FocusState.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2022/1/14.
//  Copyright © 2022 蔡志文. All rights reserved.
//

import SwiftUI

@available(iOS 15.0.0, *)
struct SU_15_FocusState: View {
    
    enum Field: Hashable {
        case username
        case password
    }
    
    @State private var username = ""
    @State private var password = ""
    @FocusState private var focusedField: Field?
    
    @State private var email = ""
    @FocusState private var focusedEmailField: Bool
    
    var body: some View {
        Form {
            TextField("Username", text: $username)
                .focused($focusedField, equals: .username)
            
            SecureField("Password", text: $password)
                .focused($focusedField, equals: .password)
            
            
            TextField("email", text: $email)
                .focused($focusedEmailField)
            Button("Sign In") {
                if username.isEmpty {
                    focusedField = .username
                } else if password.isEmpty {
                    focusedField = .password
                } else if email.isEmpty {
                    focusedEmailField = true
                } else {
                    signIn()
                }
            }
        }
        
    }
    
    func signIn() {
        
    }
}

@available(iOS 15.0.0, *)
struct SU_15_FocusState_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SU_15_FocusState()
        }
    }
}
