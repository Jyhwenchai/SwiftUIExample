//
//  SU_Stepper.swift
//  SwiftUIExample
//
//  Created by 蔡志文 on 2020/3/11.
//  Copyright © 2020 蔡志文. All rights reserved.
//

import SwiftUI

struct SU_Stepper: View {
    @State var step: Int = 0
    var body: some View {
        VStack {
            Stepper("Stepper1", value: $step, step: 1) { state  in
                print(state ? "touch begin" : "touch end")
            }
            
            VStack {
                Stepper("Stepper2", value: $step, in: 10...100, step: 5) { _ in }
                Text("Stepper2 current value: \(step)")
            }
        
            Stepper(onIncrement: {
                self.step += 1
            }, onDecrement: {
                self.step -= 1
            }) {
                Text("Stepper3 current value: \(step)")
            }

        }
    }
}

struct SU_Stepper_Previews: PreviewProvider {
    static var previews: some View {
        SU_Stepper()
    }
}
