//
//  SU_TextField.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/10.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_TextField: View {
  @State var input: String = "input text"
  @FocusState var textFieldIsFocused: Bool
  @State var username: String = ""
  @State var password: String = ""

  var body: some View {
    // bind a value
    VStack {
      TextField(
        "this is placeholder",
        text: $input,
        onEditingChanged: { editing in
          print(editing ? "begin editing..." : "end editing...")
        }, onCommit: {
          print("commit")
        })
      .focused($textFieldIsFocused)
      .textFieldStyle(RoundedBorderTextFieldStyle())
      .multilineTextAlignment(.center)
      .font(.system(size: 25))
      .foregroundColor(.red)
      .border(.secondary)
      .padding()

      Form {
        TextField(text: $username, prompt: Text("Required")) {
          Text("Username")
        }
        SecureField(text: $password, prompt: Text("Required")) {
          Text("Password")
        }
      }
    }
  }
}

struct SU_TextField_Previews: PreviewProvider {
  static var previews: some View {
    SU_TextField()
    }
}
