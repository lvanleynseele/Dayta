//
//  SurveyPageViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/28/23.
//

import Foundation
import SwiftUI

class SurveyPageViewModel: ObservableObject, Decodable {
    var id: String
    var pageLabel: String
    var pagePrompt: String
    
    @Published var mainSlider: SliderViewModel?
    @Published var mainToggle: LabeledToggleViewModel?
    @Published var morePrompts: ExpandableMoreSectionViewModel?
    @Published var morePromptsOpened: Bool
    
    init(id: String, pageLabel: String, pagePrompt: String, mainSlider: SliderViewModel?, mainToggle: LabeledToggleViewModel?, morePrompts: ExpandableMoreSectionViewModel?) {
        self.id = id
        self.pageLabel = pageLabel
        self.pagePrompt = pagePrompt
        self.mainSlider = mainSlider ?? nil
        self.mainToggle = mainToggle ?? nil
        self.morePrompts = morePrompts ?? nil
        self.morePromptsOpened = false
    }
    
    let decoder = JSONDecoder()
    
    
    private enum codingKey: String, CodingKey {
        case id
        case pageLabel
        case pagePrompt
        case mainSlider
        case mainToggle
        case morePrompts
    }

    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: codingKey.self)
            id = try values.decode(String.self, forKey: .id)
            pageLabel = try values.decode(String.self, forKey: .pageLabel)
            pagePrompt = try values.decode(String.self, forKey: .pagePrompt)
            mainSlider = try values.decodeIfPresent(SliderViewModel.self, forKey: .mainSlider)
            mainToggle = try values.decodeIfPresent(LabeledToggleViewModel.self, forKey: .mainToggle)
            morePrompts = try values.decodeIfPresent(ExpandableMoreSectionViewModel.self, forKey: .morePrompts)
            morePromptsOpened = false
        }
}


