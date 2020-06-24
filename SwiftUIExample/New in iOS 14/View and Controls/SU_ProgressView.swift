//
//  SU_ProgressView.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// # ProgressView
/// 显示任务完成进度的视图。
///
/// ## Overview
/// 使用进度视图可以显示任务正在逐步完成。进度视图可以显示确定的（完成百分比）和不确定的（正在进行或不正在进行）类型的进度。
///
/// 通过初始化一个ProgressView，并绑定一个表示进度的数字值和一个表示任务完成的总值，从而创建确定的进度视图。默认情况下，进度为0.0，总计为1.0。
///
/// ## Styling Progress Views
/// 您可以通过创建符合 `ProgressViewStyle` 协议的样式来自定义进度视图的外观和交互。默认系统提供了两种风格的 `ProgressViewStyle` ，要为视图中的所有进度视图实例设置特定样式，请使用 `progressViewStyle（_ :)` 修饰符。
struct SU_ProgressView: View {

    @State private var progress = 0.5
    @State private var persent: Int64 = 10
    private let progressView = Progress(totalUnitCount: 100)
    var body: some View {
        VStack {
            ProgressView(value: progress)
            Button("More", action: { progress += 0.05 })
            
            ProgressView("loading")
                .offset(x: 0, y: 10)
            
            
            ProgressView("progress", value: 0.5, total: 1)
                .progressViewStyle(DarkBlueShadowProgressViewStyle())
                .offset(x: 0, y: 50)
            
            ProgressView(progressView)
                .offset(x: 0, y: 100)
            Button("add", action: { progressView.completedUnitCount += persent })
                .offset(x: 0, y: 110)
            
        }.padding(.horizontal, 10)
    }
}


struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .foregroundColor(Color.orange)
            .accentColor(.orange)   // 进度条颜色
            .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                    radius: 4.0, x: 1.0, y: 2.0)
    }
}

struct SU_ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        SU_ProgressView()
    }
}

