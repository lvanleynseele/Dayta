//
//  LabeledToggle.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/24/23.
//

import SwiftUI
import Foundation

struct LabeledToggle: View {
    @ObservedObject var model: LabeledToggleViewModel
    @State var input: Bool = false
    
    var body: some View {
        Toggle(model.prompt, isOn: $input)
            .padding()
            .onChange(of: input) { newState in
                model.inputState = newState
            }
    }
}
