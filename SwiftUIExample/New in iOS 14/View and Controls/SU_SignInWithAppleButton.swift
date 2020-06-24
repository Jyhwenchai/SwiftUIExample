//
//  SU_SignInWithAppleButton.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// # SignInWithAppleButton
/// 专门用于做苹果登录的按钮
struct SU_SignInWithAppleButton: View {
    var body: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case .success (let authResults):
                    print("Authorization successful.", authResults)
                case .failure (let error):
                    print("Authorization failed: " + error.localizedDescription)
                }
            }
        )
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding(10)
    }
}

struct SU_SignInWithAppleButton_Previews: PreviewProvider {
    static var previews: some View {
        SU_SignInWithAppleButton()
    }
}
