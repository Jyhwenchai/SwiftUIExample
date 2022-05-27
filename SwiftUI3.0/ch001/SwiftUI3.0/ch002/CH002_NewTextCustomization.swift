//
//  CH002_NewTextCustomization.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/21.
//

import SwiftUI

struct CH002_NewTextCustomization: View {
    var body: some View {
        VStack {
            // 1. Mark Down
            // 2. Italic
            // 3. Links
            Text("Hello **iJustine**")
            Text("Hello ***iJustine***")
            Text("Hello ***iJustine***")
            Text("""
                Hello ***iJustine***
                Subscrite to [baidu](https://www.baidu.com)
            """)
            
            // custom formatter for date
            Text(Date().formatted(date: .abbreviated, time: .complete))
        }
    }
}

struct CH002_NewTextCustomization_Previews: PreviewProvider {
    static var previews: some View {
        CH002_NewTextCustomization()
    }
}
