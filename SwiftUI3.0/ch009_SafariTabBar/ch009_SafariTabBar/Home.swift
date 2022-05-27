//
//  Home.swift
//  ch009_SafariTabBar
//
//  Created by 蔡志文 on 2022/5/19.
//

import SwiftUI

struct Home: View {
    
    var proxy: GeometryProxy
    
    @StateObject var bottomBarModel = BottomBarViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    // Keyboard Focus state
    @FocusState var showKeyboard: Bool
    
    var body: some View {
        ZStack {
            
            let bottomEdge = proxy.safeAreaInsets.bottom
            
            // Sample ScrollView
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 15) {
                    ForEach(1...6, id: \.self) { index in
                        Rectangle()
                            .fill(Color.orange)
                            .frame(width: proxy.size.width - 30, height: 150)
                            .cornerRadius(8)
                    }
                }
                .padding()
                .padding(.bottom, 70)
                // Creating Offset Modifier
                .modifier(OffsetModifier())
                .environmentObject(bottomBarModel)
            }
            // to start from 0
            // just set Coordinate Space for scrollView
            .coordinateSpace(name: "TabScroll")
            
            // SearchView
            VStack {
                HStack {
                    Button(action: {}) {
                        Image(systemName: "book")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Button("Cancel") {
                        showKeyboard.toggle()
                    }
                    .foregroundColor(.primary)
                }
                // max height for bottom bar adjustment
                .frame(height: 40)
                // padding bottom bottom bar size
                // 60 + 10
                .padding(.bottom, 70)
                
                if showKeyboard {
                    Text("Favourite's")
                        .font(.title.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(colorScheme == .dark ? Color.black : Color.white)
            .opacity(showKeyboard ? 1 : 0)
            
            // BottomBar
            BottomBar(showKeyboard: _showKeyboard, bottomEdge: bottomEdge)
            // setting object
                .environmentObject(bottomBarModel)
                .padding(.top, 50)
            // Moving down
                .offset(y: bottomBarModel.tabState == .floating ? 0 : (bottomEdge == 0 ? 15 : bottomEdge))
                .padding(.bottom, bottomEdge == 0 ? 15 : 0)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            Home(proxy: proxy)
        }
    }
}


// BottomBar...
struct BottomBar: View {
    
    @EnvironmentObject var bottomBarModel: BottomBarViewModel
    
    // NameSpace for Animation
    @Namespace var animation
    
    @FocusState var showKeyboard: Bool
    
    var bottomEdge: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: bottomBarModel.tabState == .floating ? 12 : 0)
                .fill(.regularMaterial)
                .preferredColorScheme(bottomBarModel.tabState == .floating ? .dark : .light)
            
            HStack {
                // Hiding when Expanding
                if bottomBarModel.tabState == .floating {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    .padding(.trailing, 10)
                    
                    Button(action: {}) {
                        Image(systemName: "chevron.right")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
              
                HStack {
                    
                     Image(systemName: "magnifyingglass")
                         .font(.title2)
                         .foregroundColor(.primary)
                    if bottomBarModel.tabState == .floating {
                        TextField("", text: $bottomBarModel.searchText)
                            .matchedGeometryEffect(id: "SearchField", in: animation)
                            .focused($showKeyboard)
                            .submitLabel(.go)
                    } else {
                        Text(bottomBarModel.searchText)
                            .matchedGeometryEffect(id: "SearchField", in: animation)
                    }
                     
                     Image(systemName: "lock")
                         .symbolVariant(.fill)
                         .font(.caption)
                         .foregroundStyle(.secondary)
                     
                }
                .offset(y: bottomBarModel.tabState == .floating ? 0 : (bottomEdge == 0 ? 0 : -10))
                // max width when expanded
                .frame(maxWidth: bottomBarModel.tabState == .floating ? nil : 200)
                
                if bottomBarModel.tabState == .floating {
                    Button(action: {}) {
                        Image(systemName: "line.3.horizontal")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "square.on.square")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                }
            }
            .preferredColorScheme(bottomBarModel.tabState == .floating ? .dark : .light)
            .padding(.horizontal)
        }
        .frame(height: 60)
        .padding([.horizontal], bottomBarModel.tabState == .expanded ? 0 : 15)
        // moving view up
        .frame(maxHeight: .infinity, alignment: showKeyboard ? .top : .bottom)
        // when expanded go back to floating
        .onTapGesture {
            withAnimation(.easeOut.speed(1.5)) {
                bottomBarModel.tabState = .floating
            }
        }
        
        .animation(.easeOut, value: showKeyboard)
        
    }
}

struct OffsetModifier: ViewModifier {
    @EnvironmentObject var model: BottomBarViewModel
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy -> Color in
                    let minY = proxy.frame(in: .named("TabScroll")).minY
                    
                    DispatchQueue.main.async {
                        // Checking and toggling states
                        
                        // Duration offset
                        // you value
                        
                        let durationOffset: CGFloat = 35
                        
                        
                        
                        if minY < model.offset &&
                            -minY > (model.lastStoredOffset + durationOffset) {
                            if model.offset < 0 {
                                print("up")
                                withAnimation(.easeOut.speed(1.5)) {
                                    model.tabState = .expanded
                                }
                                
                                model.lastStoredOffset = -model.offset
                            }
                        }
                        
                        
                        
                        if minY > model.offset &&
                        -minY < (model.lastStoredOffset - durationOffset) {
                            print("down")
                            withAnimation(.easeOut.speed(1.5)) {
                                model.tabState = .floating
                            }
                            
                            // storing last offset
                            model.lastStoredOffset = -model.offset
                        }
                        
                      
                        model.offset = minY
                    }
                    
                    return Color.clear
                }
                , alignment: .top
            )
    }
}
