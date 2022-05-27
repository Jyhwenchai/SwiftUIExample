//
//  Ch001_SafeAreaInset.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/19.
//

import SwiftUI

struct CH001_SafeAreaInset: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(1...25, id: \.self) { _ in
                    HStack {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 45, height: 45)
                        VStack(alignment: .leading, spacing: 5) {
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 15)
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 15)
                                .padding(.trailing, 50)
                        }
                    }
                }
            }
            .padding()
        }
        .safeAreaInset(edge: .bottom) {
            // 会自动为主体内容添加 padding
            Capsule()
                .fill(Color.red)
                .frame(height: 55)
                .padding(.horizontal)
        }
    }
}

struct CH001_SafeAreaInset_Previews: PreviewProvider {
    static var previews: some View {
        CH001_SafeAreaInset()
    }
}
