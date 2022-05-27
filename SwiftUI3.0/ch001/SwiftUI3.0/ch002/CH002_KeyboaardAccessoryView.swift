//
//  CH002_KeyboaardAccessoryView.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/21.
//

import SwiftUI

struct CH002_KeyboaardAccessoryView: View {
    var body: some View {
        VStack {
            TextField("Type here", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            // Keyboard Accessory View...
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        HStack {
                            Button {
                                
                            } label: {
                                Image(systemName: "person")
                                    .foregroundColor(.red)
                            }

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForEach(1...30, id: \.self) { _ in 
                                        Circle()
                                            .fill(Color.purple)
                                            .frame(width: 40, height: 40)
                                    }
                                }
                            }
                        }
                    }
                }
        }
    }
}

struct CH002_KeyboaardAccessoryView_Previews: PreviewProvider {
    static var previews: some View {
        CH002_KeyboaardAccessoryView()
    }
}
