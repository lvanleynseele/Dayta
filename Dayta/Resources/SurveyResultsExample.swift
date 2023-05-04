//
//  SurveyResultsExample.swift
//  Dayta
//
//  Created by Liam van Leynseele on 4/20/23.
//

import Foundation


let surveyDataExample: [DailySurveyViewModel] =
[
    DailySurveyViewModel(survey: [SurveyPageViewModel(id: "2774ca86-e6df-42a3-938e-d1503e38af72", pageLabel: "Day Score", pagePrompt: "How was your day",
                                                      mainSlider: SliderViewModel(id: "2774ca86-e6df-42a3-938e-d1503e38af72", label: "Day Score", prompt: "Rate your day", maximumRating: 7),
                                                      mainToggle: nil, morePrompts: nil)]),
    DailySurveyViewModel(survey: [SurveyPageViewModel(id: "2774ca86-e6df-42a3-938e-d1503e38af72", pageLabel: "Day Score", pagePrompt: "How was your day",
                                                      mainSlider: SliderViewModel(id: "2774ca86-e6df-42a3-938e-d1503e38af72", label: "Day Score", prompt: "Rate your day", maximumRating: 7),
                                                      mainToggle: nil,
                                                      morePrompts: ExpandableMoreSectionViewModel(id: "2774ca86-e6df-42a3-938e-d1503e38af72", morePrompts:
                                                                                                    [LabeledToggleViewModel(id: "2774ca86-e6df-42a3-938e-d1503e38af72", label: "Gym", prompt: "Did you go to the gym?")]))]),


]
