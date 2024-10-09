//
//  OnboardingView.swift
//  MealPlanner
//
//  Created by 蔡志文 on 1/12/24.
//

import SwiftUI
///
/// 1. transaction 动画
/// 2. animation(.smooth)
/// 3. scrollTargetLayout 和 scrollTargetBehavior 的使用
/// 4. 使用 containerRelativeFrame 控制视图的大小
/// 5. 使用 scrollPosition 监听 ScrollView 滚动到的页面并实现动画绑定
struct OnboardingView: View {
  var colors: [Color] = [Color.red, Color.blue, Color.purple, Color.orange]
  var describes: [(String, String)] {
    [
      (
        "Enjoy your lunch time",
        "Just relax and not overthink what to eat. This is in our side with our personalized meal plans just prepared and adapted to your needs."
      ),
      (
        "Please Enter Your Title",
        "To offer you the best tailored diet experience we need to know more information about you."
      ),
      (
        "Please Enter Your Title",
        "Upgrade your account and get full access to jumpstart your practice full access to jumpstart your practice."
      ),
      (
        "Please Enter Your Title",
        "To offer you the best tailored diet experience we need to know more information about you."
      )
    ]
  }

  @State var describe: (String, String) = (
    "Enjoy your lunch time",
    "Just relax and not overthink what to eat. This is in our side with our personalized meal plans just prepared and adapted to your needs."
  )
  @State var scrollID: Int? = 0
  var body: some View {
    VStack {
      PagingView
      FoodDescribeView
      Spacer()
      IndicatorView
    }
  }

  var PagingView: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack(spacing: 20) {
        ForEach(0..<4) { index in
          Image("picsum0\(index + 1)")
            .resizable()
            .clipShape(.rect(cornerRadius: 12))
            .containerRelativeFrame(.horizontal) { length, _ in
              length * 0.8
            }
            .id(index)
        }
      }
      .frame(height: 230)
      .padding()
      .scrollTargetLayout()
    }
    .scrollTargetBehavior(.viewAligned)
    .scrollPosition(id: $scrollID)
    .onChange(of: scrollID ?? 0) { oldValue, newValue in
      describe = self.describes[newValue]
    }
  }

  var FoodDescribeView: some View {
    VStack(spacing: 40) {
      Text(describe.0)
        .font(.title.bold())
        .transition(.opacity.animation(.easeInOut))
        .id(describe.0)
      Text(describe.1)
        .padding(.horizontal, 60)
        .multilineTextAlignment(.center)
        .transition(.opacity.animation(.easeInOut))
        .id(describe.1)
    }
  }

  var IndicatorView: some View {
    HStack {
      HStack(spacing: 10, content: {
        ForEach(0..<4) { index in
          Capsule()
            .fill(scrollID == index ? Color.purple : Color(hex: "dbdbdb"))
            .frame(width: scrollID == index ? 50 : 10, height: 10)
            .animation(.smooth, value: scrollID)
        }
      })

      Spacer()

      Button(action: {}) {
        Text("Next")
          .font(.title2.bold())
          .foregroundStyle(Color.white)
      }
      .frame(width: 136, height: 54)
      .background(Color.purple)
      .clipShape(.rect(cornerRadius: 10))
    }
    .padding(.horizontal, 40)
  }
}

#Preview {
    OnboardingView()
}
