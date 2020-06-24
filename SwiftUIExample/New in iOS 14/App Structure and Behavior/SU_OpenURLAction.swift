//
//  SU_OpenURLAction.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// # OpenURLAction
/// 提供用于打开 URL 的功能。
///
/// `OpenURLAction` 应该从环境中获取，并且由于某些用户操作而可以用于打开URL。
struct SU_OpenURLAction: View {
    @Environment(\.openURL) var openURL

    var body: some View {
        Button(action: contactSupport) {
            Text("Email Support")
            Image(systemName: "envelope.open")
        }
    }

    func contactSupport() {
        let url = URL(string: "https://www.baidu.com/")!
        openURL(url)
    }
}

/// 需真机运行
struct SU_OpenURLAction_Previews: PreviewProvider {
    static var previews: some View {
        SU_OpenURLAction()
    }
}
