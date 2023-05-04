//
//  SliderInputViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/31/23.
//

import Foundation
import SwiftUI


class SliderViewModel: Identifiable, ObservableObject, Codable {
    var id: String
    var label: String
    var prompt: String
    var maximumRating: Int
    
    @Published var inputState: Int
    
    init(id: String, label: String, prompt: String, maximumRating: Int) {
        self.id = id
        self.label = label
        self.prompt = prompt
        self.maximumRating = maximumRating
        self.inputState = -1
    }
    
    private enum codingKeys: CodingKey {
        case id
        case label
        case prompt
        case maximumRating
        case inputState
    }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: codingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        label = try values.decode(String.self, forKey: .label)
        prompt = try values.decode(String.self, forKey: .prompt)
        maximumRating = try values.decode(Int.self, forKey: .maximumRating)
        inputState = try values.decode(Int.self, forKey: .inputState)  //when db is set up, initialize this value to -1
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: codingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(label, forKey: .label)
        try container.encode(prompt, forKey: .prompt)
        try container.encode(maximumRating, forKey: .maximumRating)
        try container.encode(inputState, forKey: .inputState)
    }
}
