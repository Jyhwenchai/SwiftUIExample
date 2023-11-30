//
//  ContentView.swift
//  InAppNotifications
//
//  Created by 蔡志文 on 11/29/23.
//

import SwiftUI

struct ContentView: View {
  @State private var showSheet = false
  var body: some View {
    NavigationStack {
      VStack {
        Button("Show Sheet") {
          showSheet.toggle()
        }
        .sheet(isPresented: $showSheet, content: {
          Button("Show Airdrop Notification") {
            UIApplication.shared.inAppNotification(
              adaptForDynamicIsland: true,
              timeout: 5,
              swipeToClose: true) {
                HStack {
                  Image(systemName: "wifi")
                    .font(.system(size: 40))
                    .foregroundStyle(.white)

                  VStack(alignment: .leading, spacing: 2, content: {
                    Text("AirDrop")
                      .font(.callout.bold())
                      .foregroundStyle(.white)

                    Text("From iJustine!")
                      .textScale(.secondary)
                      .foregroundStyle(.gray)
                  })
                  .padding(.top, 20)

                  Spacer(minLength: 0)
                }
                .padding(15)
                .background {
                  RoundedRectangle(cornerRadius: 15)
                    .fill(.black)
                }
            }
          }
        })

        Button("Show Notification") {
          UIApplication.shared.inAppNotification(
            adaptForDynamicIsland: true,
            timeout: 5,
            swipeToClose: true) {
              HStack {
                Image("img3")
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                  .frame(width: 40, height: 30)
                  .clipShape(.circle)

                VStack(alignment: .leading, spacing: 6, content: {
                  Text("iJustne")
                    .font(.callout.bold())
                    .foregroundStyle(.white)

                  Text("Hello, This is iJustine!")
                    .textScale(.secondary)
                    .foregroundStyle(.gray)
                })
                .padding(.top, 20)

                Spacer(minLength: 0)

                Button {

                } label: {
                  Image(systemName: "speaker.slash.fill")
                    .font(.title2)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.circle)
                .tint(.white)
              }
              .padding(15)
              .background {
                RoundedRectangle(cornerRadius: 15)
                  .fill(.black)
              }
          }
        }
      }
      .navigationTitle("In App Notification's")
    }
  }
}


#Preview {
  ContentView()
}
