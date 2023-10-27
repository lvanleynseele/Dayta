//
//  SurveyPageAnalyticsViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 4/25/23.
//

import Foundation
import SwiftUI

class SurveyPageAnalyticsViewModel: Identifiable, Codable {
    
    var id: String
    var pageLabel: String
    var attributes: [SurveyAttribute]
    
    init(id: String, pageLabel: String, attributes: [SurveyAttribute]) {
        self.id = id
        self.pageLabel = pageLabel
        self.attributes = attributes
    }

    private enum codingKeys: CodingKey {
        case id
        case pageLabel
        case attributes
    }

    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: codingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        pageLabel = try values.decode(String.self, forKey: .pageLabel)
        attributes = try values.decode([SurveyAttribute].self, forKey: .attributes)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: codingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(pageLabel, forKey: .pageLabel)
        try container.encode(attributes, forKey: .attributes)
    }
}

class SurveyAttribute: Identifiable, Codable {
    var id: String
    var prompt: String
    var sliderData: SliderData?
    var toggleData: ToggleData?
    
    init(prompt: String, sliderData: SliderData? = nil, toggleData: ToggleData? = nil) {
        self.id = UUID().uuidString
        self.prompt = prompt
        self.sliderData = sliderData ?? nil
        self.toggleData = toggleData ?? nil
    }

    private enum codingKeys: CodingKey {
        case id
        case prompt
        case sliderData
        case toggleData
    }

    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: codingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        prompt = try values.decode(String.self, forKey: .prompt)
        sliderData = try values.decodeIfPresent(SliderData.self, forKey: .sliderData)
        toggleData = try values.decodeIfPresent(ToggleData.self, forKey: .toggleData)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: codingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(prompt, forKey: .prompt)
        try container.encode(sliderData, forKey: .sliderData)
        try container.encode(toggleData, forKey: .toggleData)
    }
}

class SliderData: Identifiable, Codable {
    var id: String
    var maxValue: Int
    var chartData: [SliderChartData]

    init(maxValue: Int, sliderData: [SliderChartData]?) {
        self.id = UUID().uuidString
        self.maxValue = maxValue
        self.chartData = sliderData ?? []
    }

    private enum codingKeys: CodingKey {
        case id
        case maxValue
        case chartData
    }

    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: codingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        maxValue = try values.decode(Int.self, forKey: .maxValue)
        chartData = try values.decode([SliderChartData].self, forKey: .chartData)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: codingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(maxValue, forKey: .maxValue)
        try container.encode(chartData, forKey: .chartData)
    }
}

class SliderChartData: Identifiable, Codable {
    var id: String
    var date: Date
    var value: Int
    var dayScore: Int
    
    init(date: Date, value: Int, dayScore: Int) {
        self.id = UUID().uuidString
        self.date = date
        self.value = value
        self.dayScore = dayScore
    }

    private enum codingKeys: CodingKey {
        case id
        case date
        case value
        case dayScore
    }

    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: codingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        date = try values.decode(Date.self, forKey: .date)
        value = try values.decode(Int.self, forKey: .value)
        dayScore = try values.decode(Int.self, forKey: .dayScore)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: codingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(date, forKey: .date)
        try container.encode(value, forKey: .value)
        try container.encode(dayScore, forKey: .dayScore)
    }

}

class ToggleData: Identifiable, Codable{
    var id: String
    var chartData: [ToggleChartData]
    
    init(toggleData: [ToggleChartData]?) {
        self.id = UUID().uuidString
        self.chartData = toggleData ?? []
    }

    private enum codingKeys: CodingKey {
        case id
        case chartData
    }

    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: codingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        chartData = try values.decode([ToggleChartData].self, forKey: .chartData)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: codingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(chartData, forKey: .chartData)
    }
}

class ToggleChartData: Identifiable, Codable {
    var id: String
    var date: Date
    var value: Bool
    var dayScore: Int
    
    init(date: Date, value: Bool, dayScore: Int) {
        self.id = UUID().uuidString
        self.date = date
        self.value = value
        self.dayScore = dayScore
    }

    private enum codingKeys: CodingKey {
        case id
        case date
        case value
        case dayScore
    }

    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: codingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        date = try values.decode(Date.self, forKey: .date)
        value = try values.decode(Bool.self, forKey: .value)
        dayScore = try values.decode(Int.self, forKey: .dayScore)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: codingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(date, forKey: .date)
        try container.encode(value, forKey: .value)
        try container.encode(dayScore, forKey: .dayScore)
    }
}


func mapDailySurveyToAnalyticsVM(dailySurvey: DailySurveyViewModel) -> [SurveyPageAnalyticsViewModel] {
    //map daily survey to analytics view model

    var analyticsData: [SurveyPageAnalyticsViewModel] = []
    
    

    for page in dailySurvey.survey {
        let model = SurveyPageAnalyticsViewModel(id: page.id, pageLabel: page.pageLabel, attributes: [])
        
        if(page.mainSlider != nil){
            model.attributes.append(
                SurveyAttribute(
                    prompt: page.mainSlider!.prompt,
                    sliderData: SliderData(
                        maxValue: page.mainSlider!.maximumRating,
                        sliderData: [SliderChartData(date: dailySurvey.date, value: page.mainSlider!.inputState, dayScore: dailySurvey.dayScore)]
                    )
                )
            )
        }
        if(page.mainToggle != nil){
            model.attributes.append(
                addSliderAttribute(slider: page.mainSlider!, date: dailySurvey.date, dayScore: dailySurvey.dayScore)
            )
        }
        if(page.mainToggle != nil){
            model.attributes.append(
                addToggleAttribute(toggle: page.mainToggle!, date: dailySurvey.date, dayScore: dailySurvey.dayScore)
            )
        }
        if(page.morePrompts != nil){
            for attribute in page.morePrompts!.morePrompts{
                model.attributes.append(addToggleAttribute(toggle: attribute, date: dailySurvey.date, dayScore: dailySurvey.dayScore))
            }
        }
        
        analyticsData.append(model)
    }
    
    return analyticsData
}

func addSliderAttribute(slider: SliderViewModel, date: Date, dayScore: Int) -> SurveyAttribute {
    return SurveyAttribute(
        prompt: slider.prompt,
        sliderData: SliderData(
            maxValue: slider.maximumRating, sliderData: [SliderChartData(date: date, value: slider.inputState, dayScore: dayScore)]
        )
    )
}

func addToggleAttribute(toggle: LabeledToggleViewModel, date: Date, dayScore: Int) -> SurveyAttribute {

   return SurveyAttribute(
        prompt: toggle.prompt,
        toggleData: ToggleData(
            toggleData: [ToggleChartData(date: date, value: toggle.inputState, dayScore: dayScore)]
        )
    )
}
