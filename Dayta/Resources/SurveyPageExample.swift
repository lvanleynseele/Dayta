//
//  SurveyPageExample.swift
//  Dayta
//
//  Created by Liam van Leynseele on 5/19/23.
//

import SwiftUI

let surveyPageExampleSlider: SurveyPageViewModel = SurveyPageViewModel(id: UUID().uuidString, pageLabel: "Example", pagePrompt: "Example prompt?", mainSlider: SliderViewModel(id: UUID().uuidString, label: "ExampleLabel", prompt: "Example Prompt", maximumRating: 7), morePrompts: ExpandableMoreSectionViewModel(id: UUID().uuidString, morePrompts: [LabeledToggleViewModel(id: UUID().uuidString, label: "Example more toggle label 1", prompt: "Example more toggle prompt 1"), LabeledToggleViewModel(id: UUID().uuidString, label: "Example more toggle label 2", prompt: "Example more toggle prompt 2")]))

let surveyPageExampleToggle: SurveyPageViewModel = SurveyPageViewModel(id: UUID().uuidString, pageLabel: "Example", pagePrompt: "Example prompt?", mainToggle: LabeledToggleViewModel(id: UUID().uuidString, label: "Example main toggle label", prompt: "Example toggle prompt"), morePrompts: ExpandableMoreSectionViewModel(id: UUID().uuidString, morePrompts: [LabeledToggleViewModel(id: UUID().uuidString, label: "Example more toggle label 1", prompt: "Example more toggle prompt 1"), LabeledToggleViewModel(id: UUID().uuidString, label: "Example more toggle label 2", prompt: "Example more toggle prompt 2")]))
