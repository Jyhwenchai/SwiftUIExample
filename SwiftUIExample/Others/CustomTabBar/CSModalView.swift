//
//  CSModalView.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/3/2.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

struct CSModalView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Modal View")
                    .font(.system(size: 20))
                    .bold()
                Spacer()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.blue).opacity(0.2))
        .navigationBarTitle("Modal View")
    }
}

struct CSModalView_Previews: PreviewProvider {
    static var previews: some View {
        CSModalView()
    }
}
