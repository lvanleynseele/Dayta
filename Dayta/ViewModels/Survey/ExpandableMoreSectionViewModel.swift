//
//  ExpandableMoreSectionViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/31/23.
//

import Foundation


class ExpandableMoreSectionViewModel: ObservableObject {
    
    var id: String
    @Published var morePrompts: [LabeledToggleViewModel]
    @Published var opened: Bool
    
    init(id: String, morePrompts: [LabeledToggleViewModel]) {
        self.id = id
        self.morePrompts = morePrompts
        self.opened = false
    }
    
}
