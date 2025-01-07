//
//  SensitiveContentView.swift
//  MultitaskBlur
//
//  Created by 蔡志文 on 10/30/24.
//
import SwiftUI

struct SensitiveContentView<Content: View>: View {
  @Environment(\.scenePhase) private var scenePhase
  @State private var blurRadius: CGFloat = 0
    
  private var content: Content
    
  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
    
  var body: some View {
    ZStack {
      content
        .blur(radius: blurRadius)
            
      // Shows the app logo on top of the blurred content
      if blurRadius != 0 {
        Image(systemName: "swift")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 200)
      }
    }
        
    .onChange(of: scenePhase) { _, newPhase in
      if newPhase == .inactive || newPhase == .background {
        withAnimation { blurRadius = 20 }
      } else {
        withAnimation { blurRadius = 0 }
      }
    }
  }
}
