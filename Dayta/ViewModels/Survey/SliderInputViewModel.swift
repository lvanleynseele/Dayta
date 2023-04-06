//
//  SliderInputViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/31/23.
//

import Foundation
import SwiftUI


class SliderViewModel: Identifiable, ObservableObject, Decodable {
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
        self.inputState = maximumRating/2+1
    }
    
    private enum codingKey: String, CodingKey {
        case id
        case label
        case prompt
        case maximumRating
    }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: codingKey.self)
        id = try values.decode(String.self, forKey: .id)
        label = try values.decode(String.self, forKey: .label)
        prompt = try values.decode(String.self, forKey: .prompt)
        maximumRating = try values.decode(Int.self, forKey: .maximumRating)
        inputState = maximumRating/2+1
    }
}
