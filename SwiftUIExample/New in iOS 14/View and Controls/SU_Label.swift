//
//  SU_Label.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

/// # Label
/// 用户界面项的标准标签，由带有标题的图标组成。
struct SU_Label: View {
    var body: some View {
        VStack(spacing: 20) {
            Label("Lightning", systemImage: "bolt.fill")
            Label("Lightning", systemImage: "bolt.fill")
                .labelStyle(TitleOnlyLabelStyle())
            Label("Lightning", systemImage: "bolt.fill")
                .labelStyle(IconOnlyLabelStyle())
            VStack {
                Label("Rain", systemImage: "cloud.rain")
                Label("Snow", systemImage: "snow")
                Label("Sun", systemImage: "sun.max")
            }
            .labelStyle(IconOnlyLabelStyle())
            
            HStack {
                Spacer()
                Label("Rain", systemImage: "cloud.rain")
                Label("Snow", systemImage: "snow")
                Label("Sun", systemImage: "sun.max")
                Spacer()
            }
            .labelStyle(IconOnlyLabelStyle())
            
            
            Label {
                Text("person.fullName")
                    .font(.body)
                    .foregroundColor(.primary)
                Text("person.title")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            } icon: {
                Circle()
                    .fill(Color.orange)
                    .frame(width: 44, height: 44, alignment: .center)
                    .overlay(Text("ilosic").font(.body).foregroundColor(.white))
            }
        }.font(.title)
    }
}

struct RedBorderedLabelStyle : LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .border(Color.red)
    }
}

struct SU_Label_Previews: PreviewProvider {
    static var previews: some View {
        SU_Label()
    }
}
