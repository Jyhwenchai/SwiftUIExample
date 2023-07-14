//
//  Home.swift
//  WorkThroughAnimation
//
//  Created by 蔡志文 on 7/7/23.
//

import SwiftUI

struct Home: View {
  @State private var intros = sampleIntros
  @State private var activeIntro: Intro?
  var body: some View {
    GeometryReader(content: { geometry in
      let size = geometry.size
      let safeArea = geometry.safeAreaInsets
      VStack(spacing: 0, content: {
        if let activeIntro {
//          Rectangle()
//            .fill(activeIntro.bgColor)
//            .padding(.bottom, -30)
//            .overlay {
//              Circle()
//                .fill(activeIntro.circleColor)
//                .frame(width: 38, height: 38)
//                .background(alignment: .leading) {
//                  Capsule()
//                    .fill(activeIntro.bgColor)
//                    .frame(width: size.width)
//                }
//                .background(alignment: .leading) {
//                  Text(activeIntro.text)
//                    .font(.largeTitle)
//                    .foregroundStyle(activeIntro.textColor)
//                    .frame(width: textSize(activeIntro.text))
//                    .offset(x: 10)
//                    .offset(x: activeIntro.textOffset)
//                }
//                .offset(x: -activeIntro.circleOffset)
//            }
          Rectangle()
            .fill(activeIntro.bgColor)
            .padding(.bottom, -30)
            .overlay {
              Circle()
                .fill(activeIntro.circleColor)
                .frame(width: 38, height: 38)
                .background {
                  Text(activeIntro.text)
                    .font(.largeTitle)
                    .foregroundStyle(activeIntro.textColor)
                    .frame(width: textSize(activeIntro.text))
                    .offset(x: textSize(activeIntro.text) / 2)
                  // Moving Text based on text Offset
                    .offset(x: activeIntro.textOffset)
                    .mask(
                      Rectangle()
                        .offset(x: -(textSize(activeIntro.text) / 2 ) - 20)
                    )
                }
              // Moving Circle in the Opposite Direction
                .offset(x: -activeIntro.circleOffset)
            }
        }
        // login buttons
        LogginButtons()
          .padding(.bottom, safeArea.bottom)
          .padding(.top, 10)
          .background(.black, in: .rect(topLeadingRadius: 25, topTrailingRadius: 25))
          .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 8)
      })
      .ignoresSafeArea()
    })
    .task {
      if activeIntro == nil {
        activeIntro = intros.first
        // 延迟0.15秒开始动画
        let oneSecond = UInt64(1_000_000_000 * 0.15)
        try? await Task.sleep(nanoseconds: oneSecond)
//        animate(0)
      }
    }
  }

  /// Login Buttons
  @ViewBuilder
  func LogginButtons() -> some View {
    VStack(spacing: 12, content: {
      Button {
      } label: {
        Label("Continue with apple", systemImage: "applelogo")
          .foregroundStyle(.black)
          .fillButton(.white)
      }

      Button {
      } label: {
        Label("Continue with phone", systemImage: "phone.fill")
          .foregroundStyle(.white)
          .fillButton(.secondary)
      }

      Button {
      } label: {
        Label("Sign Up With Email ", systemImage: "envelope.fill")
          .foregroundStyle(.white)
          .fillButton(.secondary)
      }

      Button {
      } label: {
        Text("Login")
          .foregroundStyle(.white)
          .fillButton(.black)
          .shadow(color: .white, radius: 1)
      }
    })
    .padding(15)
  }

  /// 动画
  func animate(_ index: Int, _ loop: Bool = true) {
    if intros.indices.contains(index + 1) {
      // 更新文本和颜色
      activeIntro?.text = intros[index].text
      activeIntro?.textColor = intros[index].textColor

      // 跟新动画
      withAnimation(.snappy(duration: 1), completionCriteria: .removed) {
        activeIntro?.textOffset = -(textSize(intros[index].text) + 20)
        activeIntro?.circleOffset = -(textSize(intros[index].text) + 20) / 2
      } completion: {
        // 重置下一次动画的改变
        withAnimation(.snappy(duration: 0.8), completionCriteria: .logicallyComplete) {
          activeIntro?.textOffset = 0
          activeIntro?.circleOffset = 0
          activeIntro?.circleColor = intros[index+1].circleColor
          activeIntro?.bgColor = intros[index+1].bgColor
        } completion: {
          // 循环动画
          animate(index + 1, loop)
        }

      }

    } else {
      if loop {
        animate(0, loop)
      }
    }

  }

  /// fetching text size based on font
  func textSize(_ text: String) -> CGFloat {
    NSString(string: text)
      .size(withAttributes: [.font: UIFont.preferredFont(forTextStyle: .largeTitle)])
      .width
  }
}

extension View {
  func fillButton(_ color: Color) -> some View {
    self
      .fontWeight(.bold)
      .frame(maxWidth: .infinity)
      .padding(.vertical, 15)
      .background(color, in: .rect(cornerRadius: 15))
  }
}

#Preview {
  ContentView()
}
