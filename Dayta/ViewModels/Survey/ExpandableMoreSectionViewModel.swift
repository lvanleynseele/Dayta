//
//  ExpandableMoreSectionViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/31/23.
//

import Foundation
import SwiftUI


class ExpandableMoreSectionViewModel: ObservableObject, Decodable {
    
    var id: String
    @Published var morePrompts: [LabeledToggleViewModel]
    @Published var opened: Bool
    
    init(id: String, morePrompts: [LabeledToggleViewModel]) {
        self.id = id
        self.morePrompts = morePrompts
        self.opened = false
    }
    
    private enum codingKey: String, CodingKey {
        case id
        case morePrompts
    }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: codingKey.self)
        id = try values.decode(String.self, forKey: .id)
        morePrompts = try values.decode([LabeledToggleViewModel].self, forKey: .morePrompts)
        opened = false
    }
}
