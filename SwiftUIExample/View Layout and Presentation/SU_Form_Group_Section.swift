//
//  SU_Form_Group_Section.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/12.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Form_Group_Section: View {
    
    private var header: some View {
        HStack {
            Image(systemName: "icloud.and.arrow.up.fill")
                .foregroundColor(.blue)
            Text("Section Header")
        }
    }
    
    private var footer: some View {
        HStack {
            Image(systemName: "icloud.and.arrow.up.fill")
                .foregroundColor(.blue)
            Text("Section Footer")
        }
    }
    
    var body: some View {
        Form {
            Section(header: header, footer: footer) {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            
            // Group in Section
            Section {
                Group {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
                
                ZStack {
                    Color(.blue)
                    Text("Group in section")
                        .bold()
                        .foregroundColor(Color.white)
                }
                
                Group {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
            }
            
            Section {
                Group {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
                
                ZStack {
                    Color(.blue)
                    Text("Group in section")
                        .bold()
                        .foregroundColor(Color.white)
                }
                
                Group {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
            }
        }
    }
}

struct SU_Form_Group_Section_Previews: PreviewProvider {
    static var previews: some View {
        SU_Form_Group_Section()
    }
}
