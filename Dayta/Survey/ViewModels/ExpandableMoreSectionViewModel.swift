//
//  ExpandableMoreSectionViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/31/23.
//

import Foundation
import SwiftUI


class ExpandableMoreSectionViewModel: ObservableObject, Codable {
    
    var id: String
    @Published var morePrompts: [LabeledToggleViewModel]
    @Published var opened: Bool
    
    init(id: String, morePrompts: [LabeledToggleViewModel]) {
        self.id = id
        self.morePrompts = morePrompts
        self.opened = false
    }
    
    private enum codingKeys: String, CodingKey {
        case id
        case morePrompts
        case opened
    }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: codingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        morePrompts = try values.decode([LabeledToggleViewModel].self, forKey: .morePrompts)
        opened = false
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: codingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(morePrompts, forKey: .morePrompts)
        try container.encode(opened, forKey: .opened)
    }
}
