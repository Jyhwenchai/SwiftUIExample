//
//  SU_15_TimeLineView.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2021/11/29.
//  Copyright © 2021 蔡志文. All rights reserved.
//

import SwiftUI

@available(iOS 15.0.0, *)
struct SU_15_TimeLineView: View {
    var body: some View {
        TimelineView(PeriodicTimelineSchedule(from: .now, by: 1)) { context in
            Text("\(context.date)")
        }
    }
}

@available(iOS 15.0.0, *)
struct SU_15_TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        SU_15_TimeLineView()
    }
}
