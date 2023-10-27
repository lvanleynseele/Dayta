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



let sliderdata: SliderData = SliderData(maxValue: 5, sliderData: [
    SliderChartData(date: Date.now, value: 2,  dayScore: 7),
    SliderChartData(date: Date.init(timeInterval: 100000, since: Date.now), value: 4,  dayScore: 3),
    SliderChartData(date: Date.init(timeInterval: 200000, since: Date.now), value: 5,  dayScore: 6),
    SliderChartData(date: Date.init(timeInterval: 300000, since: Date.now), value: 2,  dayScore: 6),
    SliderChartData(date: Date.init(timeInterval: 400000, since: Date.now), value: 3,  dayScore: 6),
    SliderChartData(date: Date.init(timeInterval: 500000, since: Date.now), value: 1,  dayScore: 6),
    SliderChartData(date: Date.init(timeInterval: 600000, since: Date.now), value: 5,  dayScore: 6),
    SliderChartData(date: Date.init(timeInterval: 700000, since: Date.now), value: 3,  dayScore: 6),
])



let sliderChartDataExample: SurveyAttribute = SurveyAttribute(prompt: "Productivitty", sliderData: sliderdata)


let toggledata: ToggleData = ToggleData(toggleData: [
    ToggleChartData(date: Date.now, value: true,  dayScore: 7),
    ToggleChartData(date: Date.init(timeInterval: 100000, since: Date.now), value: true,  dayScore: 3),
    ToggleChartData(date: Date.init(timeInterval: 200000, since: Date.now), value: false,  dayScore: 6),
    ToggleChartData(date: Date.init(timeInterval: 300000, since: Date.now), value: true,  dayScore: 6),
    ToggleChartData(date: Date.init(timeInterval: 400000, since: Date.now), value: false,  dayScore: 6),
    ToggleChartData(date: Date.init(timeInterval: 500000, since: Date.now), value: false,  dayScore: 6),
    ToggleChartData(date: Date.init(timeInterval: 600000, since: Date.now), value: true,  dayScore: 6),
    ToggleChartData(date: Date.init(timeInterval: 700000, since: Date.now), value: false,  dayScore: 6),
])

let toggleChartDataExample: SurveyAttribute = SurveyAttribute(prompt: "Productivity", toggleData: toggledata)


let sliderSurveyAttribute: SurveyAttribute = SurveyAttribute(prompt: "How productive were you today?", sliderData: sliderdata)

let toggleSurveyAttribute: SurveyAttribute = SurveyAttribute(prompt: "Did you commit code?", toggleData: toggledata)


let SurveyPageAnalyticsExample: SurveyPageAnalyticsViewModel = SurveyPageAnalyticsViewModel(id: UUID().uuidString, pageLabel: "Productivity", attributes: [sliderSurveyAttribute, toggleSurveyAttribute])
