//
//  LabeledToggleViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/31/23.
//

import Foundation

class LabeledToggleViewModel: ObservableObject, Identifiable, Codable {
    var id: String
    var label: String
    var prompt: String
    @Published var inputState: Bool = false
    
    init(id: String, label: String, prompt: String) {
        self.id = id
        self.label = label
        self.prompt = prompt
        self.inputState = false
    }
    
    private enum codingKeys: String, CodingKey {
        case id
        case label
        case prompt
        case inputState
    }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: codingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        label = try values.decode(String.self, forKey: .label)
        prompt = try values.decode(String.self, forKey: .prompt)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: codingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(label, forKey: .label)
        try container.encode(prompt, forKey: .prompt)
        try container.encode(inputState, forKey: .inputState)
    }
}
