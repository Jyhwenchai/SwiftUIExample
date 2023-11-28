//
//  Home.swift
//  HeartAnimation
//
//  Created by 蔡志文 on 11/28/23.
//

import SwiftUI

struct Home: View {
  @State private var beatAnimation = false
  @State private var showPusles = false
  @State private var pulsedHearts: [HeartParticle] = []
  @State private var heartBeat = 85
  var body: some View {
    VStack {
      ZStack {
        if showPusles {
          TimelineView(.animation(minimumInterval: 0.7, paused: false)) { timeline in
            /// Method 1
//            ZStack {
//              ForEach(pulsedHearts) { _ in
//                PulseHeartView()
//              }
//            }
//            .onChange(of: timeline.date) { oldValue, newValue in
//              if beatAnimation {
//                addPulsedHeart()
//              }
//            }

            /// Method 2
            Canvas { context, size in
              for heart in pulsedHearts {
                if let resolvedView = context.resolveSymbol(id: heart.id) {
                  let centerX = size.width / 2
                  let centerY = size.height / 2
                  context.draw(resolvedView, at: CGPoint(x: centerX, y: centerY))
                }
              }
            } symbols: {
              ForEach(pulsedHearts) { heart in
                PulseHeartView()
                  .id(heart.id)
              }
            }
            .onChange(of: timeline.date) { oldValue, newValue in
              if beatAnimation {
                addPulsedHeart()
              }
            }
          }
        }

        Image(systemName: "suit.heart.fill")
          .font(.system(size: 100))
          .foregroundStyle(.heart.gradient)
          .symbolEffect(.bounce, options: !beatAnimation ? .default : .repeating.speed(1.4), value: beatAnimation)
      }
      .frame(maxWidth: 350, maxHeight: 350)
      .overlay(alignment: .bottomLeading, content: {
        VStack(alignment: .leading, content: {
          Text("Current")
            .font(.title3.bold())
            .foregroundStyle(.white)

          HStack(alignment: .bottom, content: {
            TimelineView(.animation(minimumInterval: 1.5, paused: false)) { timeline in
              Text("\(heartBeat)")
                .font(.system(size: 45).bold())
                .contentTransition(.numericText(value: Double(heartBeat)))
                .foregroundStyle(.white)
                .onChange(of: timeline.date) { oldValue, newValue in
                  if beatAnimation {
                    withAnimation(.bouncy) {
                      heartBeat = .random(in: 80...130)
                    }
                  }
                }
            }

            Text("BPM")
              .font(.callout.bold())
              .foregroundStyle(.heart.gradient)
          })

          Text("88 BPM, 10m ago")
            .font(.callout)
            .foregroundStyle(.gray)
        })
        .offset(x: 30, y: -35)
      })
      .background(.bar, in: .rect(cornerRadius: 30))

      Toggle("Beat Animation", isOn: $beatAnimation)
        .padding(15)
        .frame(maxWidth: 350)
        .background(.bar, in: .rect(cornerRadius: 15))
        .padding(.top, 20)
        .onChange(of: beatAnimation) { oldValue, newValue in
          if pulsedHearts.isEmpty {
            showPusles = true
          }

          if newValue && pulsedHearts.isEmpty {
            addPulsedHeart()
          }
        }
        .disabled(!beatAnimation && !pulsedHearts.isEmpty)
    }
  }

  func addPulsedHeart() {
    let pulsedHeart = HeartParticle()
    pulsedHearts.append(pulsedHeart)

    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      pulsedHearts.removeAll { $0.id == pulsedHeart.id }
      if pulsedHearts.isEmpty {
        showPusles = false
      }
    }
  }
}

struct PulseHeartView: View {
  @State private var startAnimation = false
  var body: some View {
    Image(systemName: "suit.heart.fill")
      .font(.system(size: 100))
      .foregroundStyle(.heart)
      .background(content: {
        Image(systemName: "suit.heart.fill")
          .font(.system(size: 100))
          .foregroundStyle(.black)
          .blur(radius: 5.0, opaque: false)
          .scaleEffect(startAnimation ? 1.1 : 0)
          .animation(.linear(duration: 1.5), value: startAnimation)
      })
      .scaleEffect(startAnimation ? 4 : 1)
      .opacity(startAnimation ? 0 : 0.7)
      .onAppear(perform: {
        withAnimation(.linear(duration: 3)) {
          startAnimation = true
        }
      })
  }
}

#Preview {
  ContentView()
}
