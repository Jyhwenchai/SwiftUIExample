//
//  CH001_CustomSheetDismiss.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/19.
//

import SwiftUI

struct CH001_CustomSheetDismiss: View {
    @State var show = false
    var body: some View {
        VStack {
            Button("Show Sheet") {
                show.toggle()
            }
        }
        .sheet(isPresented: $show) {
            Text("I'm Sheet View......")
                .interactiveDismissDisabled(true)
        }
    }
}

struct CH001_CustomSheetDismiss_Previews: PreviewProvider {
    static var previews: some View {
        CH001_CustomSheetDismiss()
    }
}
