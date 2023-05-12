//
//  Overview.swift
//  ITime
//
//  Created by 蔡志文 on 5/10/23.
//

import SwiftUI

struct Overview: View {
  @State private var isEmpty: Bool = false
  @State private var showCalendar: Bool = false
  @State private var selectedDate = Date()
  @State private var coverOpacity: Double = 0
  @Binding var navigationPath: NavigationPath

  var transaction: Transaction = {
    var transaction = Transaction()
    transaction.disablesAnimations = true
    return transaction
  }()
  var body: some View {
    VStack(spacing: 0) {
      HStack {
        Button("前一天") {}
        Spacer()
        HStack {
          Button {
            withTransaction(transaction) {
              showCalendar = true
            }
          } label: {
            Text("今天")
              .foregroundColor(Color.black)
              .font(.body)
            Text("周三")
          }
        }
        Spacer()
        Button("后一天") {}
      }
      .frame(height: 35)
      .padding(.horizontal)
      .foregroundColor(Color.gray)
      .font(.caption)

      Divider()
        .opacity(0.5)

      VStack {
        if !isEmpty {
          OverviewList()
        } else {
          Spacer()
          CommonEmptyView()
          Spacer()
        }
      }
      .overlay(alignment: .bottom) {
        TimeAddButton {
          navigationPath.append("A")
        } clockAction: {

        }

      }
    }
    .fullScreenCover(isPresented: $showCalendar, content: {
      VStack {
        OverviewCalendar(selectedDate: $selectedDate, isShow: $showCalendar)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(TransparentBackground())
    })
    .navigationDestination(for: String.self) { path in
      Text("\(path.description)")
        .toolbar(.hidden, for: .tabBar)
    }
  }
}

struct Overview_Previews: PreviewProvider {
  static var previews: some View {
    Overview(navigationPath: .constant(NavigationPath()))
  }
}

struct TransparentBackground: UIViewRepresentable {
  private class BackgroundRemovalView: UIView {
    override func didMoveToWindow() {
      super.didMoveToWindow()
      superview?.superview?.backgroundColor = .clear
    }

  }

  func makeUIView(context: Context) -> UIView {
    return BackgroundRemovalView()
  }

  func updateUIView(_ uiView: UIView, context: Context) {
  }
}
