//
//  OnboardingSelectTagView.swift
//  MealPlanner
//
//  Created by 蔡志文 on 1/15/24.
//

import SwiftUI

struct OnboardingSelectTagView: View {

  @State private var selectedIndex = 0

  var body: some View {
    VStack {
      StepView
      QuestionView
      Spacer()
    }
    .padding(.horizontal, 20)
  }
  
  var StepView: some View {
    HStack {
      HStack(spacing: 10) {
        ForEach(0..<4) { index in
          ZStack {
            Circle()
              .fill(selectedIndex == index ? Color.purple : Color(hex: "eaeaea"))
              .frame(width: 32, height: 32)
            Text("\(index)")
              .foregroundStyle(selectedIndex == index ? Color.white : Color.black)
          }
          .onTapGesture {
            withAnimation(.smooth) {
              selectedIndex = index
            }
          }
        }
      }

      Spacer()

      Button(action: {}, label: {
        Text("Skip")
          .font(.title2.bold())
      })
    }
    .padding(.vertical)
    .padding(.leading, 10)
  }

  var QuestionView: some View {
    VStack(spacing: 30) {
      Text("Any ingredient \nallergies?")
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.title.bold())
      Text("To offer you the best tailored diet experience we need to know more information about you.")
    }
    .padding(.trailing, 100)
    .padding(.top, 20)
  }

}

#Preview {
    OnboardingSelectTagView()
}
