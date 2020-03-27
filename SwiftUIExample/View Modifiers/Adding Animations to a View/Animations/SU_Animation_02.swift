//
//  SU_Animation_02.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/26.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Animation_02: View {
    @State var showCard = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            CardView(color: Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                .offset(y: showCard ? -400 : -40)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(showCard ? 10 : 0))
                .rotation3DEffect(.degrees(showCard ? 15 : 0), axis: (x: 1, y: 0, z: 0))
                .animation(Animation.default.delay(0.2))
                .blendMode(showCard ? .hardLight : .normal)
            CardView(color: Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
                .offset(x: 0, y: showCard ? -200 : -20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(.degrees(showCard ? 5 : 0))
                .rotation3DEffect(.degrees(showCard ? 10 : 0), axis: (x: 1, y: 0, z: 0))
                .animation(Animation.default.delay(0.1))
                .blendMode(showCard ? .hardLight : .normal)
            CardView(color:Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                .offset(x: viewState.width, y: viewState.height)
                .rotation3DEffect(.degrees(showCard ? 5 : 0), axis: (x: 1, y: 0, z: 0))
                .blendMode(showCard ? .hardLight : .normal)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.viewState = value.translation
                    }
                    .onEnded { value in
                        self.viewState = .zero
                    }
                )
        }
    }
}

struct SU_Animation_02_Previews: PreviewProvider {
    static var previews: some View {
        SU_Animation_02()
    }
}

struct CardView: View {
    var color: Color
    var body: some View {
        Text("Card")
            .font(.system(size: 28, weight: .bold))
            .frame(width: 275, height: 200)
            .foregroundColor(Color.white)
            .background(color)
            .cornerRadius(20)
            .shadow(color: color.opacity(0.2), radius: 20, x: 0, y: 20)
    }
}
