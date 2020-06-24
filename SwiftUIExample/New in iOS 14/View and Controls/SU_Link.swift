//
//  SU_Link.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// # Link
/// 用于导航到URL的控件。
///
/// 您可以通过提供目标URL和标题来创建链接。标题告诉用户链接的目的，它可以是字符串，也可以是标题键，它返回本地化的字符串，该字符串用于构造在应用程序用户界面中向用户显示的标签。
struct SU_Link: View {
    var body: some View {
        Link("View Our Terms of Service",
              destination: URL(string: "https://www.example.com/TOS.html")!)
    }
}

struct SU_Link_Previews: PreviewProvider {
    static var previews: some View {
        SU_Link()
    }
}
