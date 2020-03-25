//
//  SU_OnReceive.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/20.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI
import Combine

#warning("TODO: 待补充")
struct SU_OnReceive: View {

    @State var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text("\(timeRemaining)")
            .onReceive(timer) { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                }
            }
    }
}

struct SU_OnReceive_Previews: PreviewProvider {
    static var previews: some View {
        SU_OnReceive()
    }
}
