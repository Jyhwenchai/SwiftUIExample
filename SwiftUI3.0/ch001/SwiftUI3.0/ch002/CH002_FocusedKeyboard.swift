//
//  CH002_FocusedKeyboard.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/21.
//

import SwiftUI

struct CH002_FocusedKeyboard: View {
    
    @FocusState var showKeyBoard: Bool
    
    var body: some View {
        TextField("Type Here", text: .constant(""))
            .textFieldStyle(.roundedBorder)
            .padding()
        // Opening and dismissing keyboard
        // Natively in SwiftUI
            .focused($showKeyBoard)
        Text(showKeyBoard ? "Showing" : "Hidden")
        
        Button {
            showKeyBoard.toggle()
        } label: {
            Text("Toggle Keyboard")
        }
    }
}

struct CH002_FocusedKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        CH002_FocusedKeyboard()
    }
}
