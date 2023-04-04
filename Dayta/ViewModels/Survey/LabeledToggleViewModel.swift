//
//  LabeledToggleViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/31/23.
//

import Foundation

class LabeledToggleViewModel: ObservableObject {
    var id: String
    var label: String
    var prompt: String
    @Published var inputState: Bool = false
    
    init(label: String, prompt: String) {
        self.id = UUID().uuidString
        self.label = label
        self.prompt = prompt
        self.inputState = false
    }
}
