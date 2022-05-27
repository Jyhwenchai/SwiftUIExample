//
//  CH002_TimelineView.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/21.
//

import SwiftUI

struct CH002_TimelineView: View {
    var body: some View {
        VStack {
            TimelineView(.animation) { timeLine in
                Text(timeLine.date.formatted(date: .omitted, time: .complete))
                
                Text("\(CGFloat.random(in: 0...1000))")
            }
            Spacer()
            // customization
            TimelineView(.animation(minimumInterval: 1, paused: false)) { timeLine in
                Text("\(CGFloat.random(in: 0...1000))")
            }
        }
    }
}

struct CH002_TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        CH002_TimelineView()
    }
}
