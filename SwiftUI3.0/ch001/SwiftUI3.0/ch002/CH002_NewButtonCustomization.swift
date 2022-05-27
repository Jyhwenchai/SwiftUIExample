//
//  CH002_NewButtonCustomization.swift
//  SwiftUI3.0
//
//  Created by 蔡志文 on 2022/4/21.
//

import SwiftUI

struct CH002_NewButtonCustomization: View {
    
    @State var isOn = false
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Text("iJustine")
            }
            .buttonStyle(.bordered)
            // Large Size...
            .controlSize(.large)
            .tint(.purple)

            Toggle(isOn: $isOn) {
                Image(systemName: "star.fill")
            }
            .toggleStyle(.button)
            .controlSize(.large)
            .tint(.purple)
            
            NavigationView {
                // New Control Group
                Text("Hello")
                    .navigationTitle("Home")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            ControlGroup {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "person")
                                }
                                Button {
                                    
                                } label: {
                                    Image(systemName: "gearshape")
                                }
                            }
                            .controlGroupStyle(.navigation)
                        }
                    }
            }
        }
    }
}

struct CH002_NewButtonCustomization_Previews: PreviewProvider {
    static var previews: some View {
        CH002_NewButtonCustomization()
    }
}
