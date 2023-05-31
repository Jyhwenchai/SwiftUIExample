//
//  Target.swift
//  ITime
//
//  Created by 蔡志文 on 5/9/23.
//

import SwiftUI

struct Target: View {
  
  @State var navigationPath: NavigationPath = NavigationPath()

  var body: some View {
    NavigationStack(path: $navigationPath) {
      List {
        ForEach(0..<6, id: \.self) { index in
          HStack {
            VStack(alignment: .leading) {
              Text("睡觉")
              Spacer()
                .frame(height: 16)
              Text("普通待办 今日2小时35分钟")
                .font(.caption)
            }
            Spacer()
            Button("开始") {
            }
          }
          .listRowBackground(Color.clear)
          .listRowSeparator(.hidden)
          .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
          .padding(10)
          .background(Color(red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1)))
          .cornerRadius(10)
          .foregroundColor(Color.white)
        }
      }
      .listStyle(.inset)
      .toolbarColorScheme(.dark, for: .navigationBar)
      .navigationTitle(Text("目标"))
      .navigationBarTitleDisplayMode(.inline)
      .toolbarBackground(.visible, for: .navigationBar)
      .toolbarBackground(Color("medium_blue"), for: .navigationBar)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            navigationPath.removeLast()
          } label: {
            Image("ic_my_card21x21")
          }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            navigationPath.append(ChartData.bar)
          } label: {
            Image("ic_piechart21x21")
          }
        }

        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            navigationPath.removeLast()
          } label: {
            Image("ic_add_habit21x21")
          }
        }
      }
      .navigationDestination(for: ChartData.self) { path in
        switch path {
        case .bar: FocusStatistics()
        }
      }
    }
  }
}

struct Target_Previews: PreviewProvider {
  static var previews: some View {
    Target()
  }
}
