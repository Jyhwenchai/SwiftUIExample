//
//  ContentView.swift
//  DynamicSheet
//
//  Created by 蔡志文 on 8/25/23.
//

import SwiftUI

struct ContentView: View {
  @State private var showSheet: Bool = false
  @State private var sheetHeight: CGFloat = .zero

  @State private var emailAddress: String = ""
  @State private var password: String = ""

  @State private var sheetFirstPageHeight: CGFloat = .zero
  @State private var sheetSecondPageHeight: CGFloat = .zero

  @State private var sheetScrollProgress: CGFloat = .zero
  var body: some View {
    VStack {
      Spacer()

      Button("Show Sheet") {
        showSheet.toggle()
      }
      .buttonStyle(.borderedProminent)
      .tint(.red)
    }
    .padding(30)
    .sheet(isPresented: $showSheet, content: {
      GeometryReader { geometry in
        let size = geometry.size

        ScrollView(.horizontal) {
          HStack(alignment: .top, spacing: 0) {
            OnBoarding(size)

            LoginView(size)
          }
          /// For Paging Needs to be Enabled
          .scrollTargetLayout()
        }
          /// For Paging Needs to be Enabled
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.hidden)
      }
      .presentationCornerRadius(30)
      .presentationDetents(sheetHeight == .zero ? [.medium] : [.height(sheetHeight)])
      /// Disabling Swipe to Dismiss
      .interactiveDismissDisabled()
    })
  }


  /// First View
  @ViewBuilder
  func OnBoarding(_ size: CGSize) -> some View {
    VStack(alignment: .leading, spacing: 12, content: {
      Text("Know Everything\nabout the weather")
        .font(.largeTitle.bold())
        .lineLimit(2)

      Text(attributedSubTitle)
    })
    .padding(15)
    .padding(.horizontal, 10)
    .padding(.top, 15)
    .padding(.bottom, 130)
    .frame(width: size.width, alignment: .leading)
    .heightChangePreference { height in
      sheetFirstPageHeight = height
      sheetHeight = height
    }
  }

  @ViewBuilder
  func LoginView(_ size: CGSize) -> some View {
    VStack(alignment: .leading, spacing: 12, content: {
      Text("Create an Account")
        .font(.largeTitle.bold())

      CustomTF(hint: "Email Address", text: $emailAddress, icon: "envelope", isPassword: false)
        .padding(.top, 20)
      CustomTF(hint: "******", text: $password, icon: "lock", isPassword: true)
        .padding(.top, 20)
    })
    .padding(15)
    .padding(.horizontal, 10)
    .padding(.top, 15)
    .padding(.bottom, 220)
    .frame(width: size.width)
    .heightChangePreference { height in
      sheetSecondPageHeight = height
    }
    .minXChangePreference { minX in
      let diff = sheetSecondPageHeight - sheetFirstPageHeight
      /// Truncating minx between (0 to screen width)
      let truncatedMinX = min(size.width - minX, size.width)
      guard truncatedMinX > 0 else { return }
      let progress = truncatedMinX / size.width
      sheetScrollProgress = progress
      /// Adding the Diference Height to the Sheet Height
      sheetHeight = sheetFirstPageHeight + (diff * progress)
    }
  }

  var attributedSubTitle: AttributedString {
    let string = "Start now and learn more about local weather intantly"
    var attString = AttributedString(stringLiteral: string)
    if let range = attString.range(of: "local weather") {
      attString[range].foregroundColor = .black
      attString[range].font = .callout.bold()
    }
    return attString
  }
}

#Preview {
  ContentView()
}

struct CustomTF: View {
  var hint: String
  @Binding var text: String
  var icon: String
  var isPassword: Bool
  var body: some View {
    VStack(alignment: .leading, spacing: 12, content: {
      if isPassword {
        SecureField(hint, text: $text)
      } else {
        TextField(hint, text: $text)
      }
      Divider()
    })
    .overlay(alignment: .trailing) {
      Image(systemName: icon)
        .foregroundStyle(.gray)
    }
  }
}
