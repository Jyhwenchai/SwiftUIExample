//
//  SU_Form.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/**
 ## 表单
 表单是一个静态滚动列表，用于放置一些基础的视图控件或者是其他容器类（如：Section、Group）

 SwiftUI 将以适合平台的方式呈现表单。例如，在iOS上，表单显示为分组列表。使用“部分”将表单内容的不同部分分组
 */
struct SU_Form: View {
    var body: some View {
        Form {
            Text("Hello World!")
            Button(action: {}) {
                Text("Button")
            }
        }
    }
}

struct SU_Form_Previews: PreviewProvider {
    static var previews: some View {
        SU_Form()
    }
}
