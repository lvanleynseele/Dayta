//
//  SurveyPageViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/28/23.
//

import Foundation
import SwiftUI

class SurveyPageViewModel: Identifiable, ObservableObject, Codable {
    var id: String
    var pageLabel: String
    var pagePrompt: String
    
    @Published var mainSlider: SliderViewModel?
    @Published var mainToggle: LabeledToggleViewModel?
    @Published var morePrompts: ExpandableMoreSectionViewModel?
    
    init(id: String, pageLabel: String, pagePrompt: String, mainSlider: SliderViewModel?, mainToggle: LabeledToggleViewModel?, morePrompts: ExpandableMoreSectionViewModel?) {
        self.id = id
        self.pageLabel = pageLabel
        self.pagePrompt = pagePrompt
        self.mainSlider = mainSlider ?? nil
        self.mainToggle = mainToggle ?? nil
        self.morePrompts = morePrompts ?? nil
    }
    
    private enum codingKeys: CodingKey {
        case id
        case pageLabel
        case pagePrompt
        case mainSlider
        case mainToggle
        case morePrompts
        case morePromptsOpened
    }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: codingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        pageLabel = try values.decode(String.self, forKey: .pageLabel)
        pagePrompt = try values.decode(String.self, forKey: .pagePrompt)
        mainSlider = try values.decodeIfPresent(SliderViewModel.self, forKey: .mainSlider)
        mainToggle = try values.decodeIfPresent(LabeledToggleViewModel.self, forKey: .mainToggle)
        morePrompts = try values.decodeIfPresent(ExpandableMoreSectionViewModel.self, forKey: .morePrompts)
    }
        
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: codingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(pageLabel, forKey: .pageLabel)
        try container.encode(pagePrompt, forKey: .pagePrompt)
        try container.encodeIfPresent(mainSlider, forKey: .mainSlider)
        try container.encodeIfPresent(mainToggle, forKey: .mainToggle)
        try container.encodeIfPresent(morePrompts, forKey: .morePrompts)
    }
    
}


