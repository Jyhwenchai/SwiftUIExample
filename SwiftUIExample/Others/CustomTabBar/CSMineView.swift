//
//  MineView.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/3/2.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

struct CSMineView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Mine View")
                    .font(.system(size: 20))
                    .bold()
                Spacer()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.red).opacity(0.2))
        .navigationBarTitle("Mine View")
    }
}

struct MineView_Previews: PreviewProvider {
    static var previews: some View {
        CSMineView()
    }
}
