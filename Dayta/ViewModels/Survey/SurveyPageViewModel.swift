//
//  SurveyPageViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/28/23.
//

import Foundation
import SwiftUI

class SurveyPageViewModel: ObservableObject {
    var id: String
    var pageLabel: String
    var mainPrompt: promptInputs
    var morePrompts: ExpandableMoreSectionViewModel
    
    
//    @Published var mainInput: Int
    @Published var morePromptsOpened: Bool
    
    init(id: String, pageLabel: String, mainPrompt: promptInputs, morePrompts: ExpandableMoreSectionViewModel) {
        self.id = id
        self.pageLabel = pageLabel
        self.mainPrompt = mainPrompt
        self.morePrompts = morePrompts
        
//        self.mainInput = 4
        self.morePromptsOpened = false
    }
    
    
}
