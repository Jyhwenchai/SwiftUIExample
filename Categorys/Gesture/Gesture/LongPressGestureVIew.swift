//
//  LoginGesture_.swift
//  Gesture
//
//  Created by 蔡志文 on 6/26/23.
//

import SwiftUI

struct LongPressGestureView: View {
  @State var color: Color = .green

  @GestureState private var isDetectingLongPress = false
  @State private var completedLongPress = false

  var longPress: some Gesture {
    LongPressGesture(minimumDuration: 3)
      .updating($isDetectingLongPress) { currentState, gestureState, transaction in
        print(currentState, gestureState)
        gestureState = currentState
        transaction.animation = Animation.easeIn(duration: 2.0)
      }
      .onEnded { finished in
        self.completedLongPress = finished
      }
  }

  var body: some View {
    VStack {
      Circle()
        .fill(color)
      // `minmumDuration`: 最短时间间隔，超过则手势有效
      // `maximumDistance`: 最长时间间隔，超过则手势失效
        .onLongPressGesture(minimumDuration: 0.5, maximumDistance: 5) {
          color = Color.random
        } onPressingChanged: { changed in
          print(changed)
        }

      Circle()
        .fill(self.isDetectingLongPress ?
            Color.red :
            (self.completedLongPress ? Color.random : Color.blue))
        .gesture(longPress)
    }
    .frame(width: 100)
  }
}

#Preview {
  LongPressGestureView()
}
