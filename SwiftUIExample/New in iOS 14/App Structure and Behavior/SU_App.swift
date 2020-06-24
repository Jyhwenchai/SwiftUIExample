//
//  SU_App.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/6/23.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

//@main
//struct SU_App: App {
//    var body: some Scene {
//        WindowGroup {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        }
//    }
//}

//struct SU_App_Previews: PreviewProvider {
//    static var previews: some View {
//        SU_App()
//    }
//}

//struct SU_App_Previews: PreviewProvider {
//    static var previews: some View {
//        SU_App()SupportView
//    }
//}
struct SupportView : View {
    @Environment(\.openURL) var openURL

    var body: some View {
        Button(action: contactSupport) {
            Text("Email Support")
            Image(systemName: "envelope.open")
        }
    }

    func contactSupport() {
        let url = URL(string: "https://www.baidu.com/")!
        openURL(url)
    }
    
}

struct SupportView_Previews: PreviewProvider {
    static var previews: some View {
        SupportView()
    }
}
