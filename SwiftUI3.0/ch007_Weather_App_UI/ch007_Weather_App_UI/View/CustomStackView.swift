//
//  CustomStackView.swift
//  ch007_Weather_App_UI
//
//  Created by 蔡志文 on 2022/5/7.
//

import SwiftUI

struct CustomStackView<Title: View, Content: View>: View {
    var titleView: Title
    var contentView: Content
    
    @State var topOffset: CGFloat = 0
    @State var bottomOffset: CGFloat = 0
    
    init(@ViewBuilder titleView: @escaping () -> Title, @ViewBuilder contentView: @escaping () -> Content) {
        self.contentView = contentView()
        self.titleView = titleView()
    }
    var body: some View {
        VStack(spacing: 0) {
            titleView
                .font(.callout)
                .lineLimit(1)
                .frame(height: 38)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .background(.ultraThinMaterial, in: CustomCorner(corners: bottomOffset < 38 ? .allCorners : [.topLeft, .topRight], radius: 12))
                .zIndex(1)
            VStack {
                Divider()
                
                contentView
                    .padding()

            }
            .background(.ultraThinMaterial, in: CustomCorner(corners: [.bottomLeft, .bottomRight], radius: 12))
            .offset(y: topOffset >= 120 ? 0 : -(-topOffset + 120))
            .zIndex(0)
            .clipped()
            .opacity(getOpacity())
        }
        .preferredColorScheme(.dark)
        .cornerRadius(12)
        .opacity(getOpacity())
        .offset(y: topOffset >= 120 ? 0 : -topOffset + 120)
        .background(
            GeometryReader{ proxy -> Color in
                let minY = proxy.frame(in: .global).minY
                let maxY = proxy.frame(in: .global).maxX
                DispatchQueue.main.async {
                    self.topOffset = minY
                    self.bottomOffset = maxY - 120
                }
                return Color.clear
            }
        )
        .modifier(CornerModifer(bottomOffset: $bottomOffset))
    }
    
    func getOpacity() -> CGFloat {
        if bottomOffset < 28 {
            let progress = bottomOffset / 28
            return progress
        }
        return 1
    }
}

struct CustomStackView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CornerModifer: ViewModifier {
    @Binding var bottomOffset: CGFloat
    
    func body(content: Content) -> some View {
        if bottomOffset < 38 {
            content
        } else {
            content
                .cornerRadius(12)
        }
    }
}
