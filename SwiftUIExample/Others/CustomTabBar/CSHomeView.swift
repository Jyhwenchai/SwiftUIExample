//
//  HomeView.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/3/2.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

struct CSHomeView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Home View")
                    .font(.system(size: 20))
                    .bold()
                Spacer()
            }
            HStack {
                NavigationLink(destination: CSDetailView()) { Text("Show detail view") }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.purple).opacity(0.2))
        .navigationBarTitle("Home View")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        CSHomeView()
    }
}
