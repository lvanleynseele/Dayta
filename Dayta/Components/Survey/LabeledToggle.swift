//
//  LabeledToggle.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/24/23.
//

import SwiftUI

struct LabeledToggle: View {
    var id: String = UUID().uuidString
    var label: String
    @Binding var input: Bool
    //@Published var output: Bool
    
    
    var body: some View {
        Toggle(label, isOn: $input).padding()
    }
}


class LabeledToggleOutput: ObservableObject {
    
    @Published var output: Bool = false
    
    
}
