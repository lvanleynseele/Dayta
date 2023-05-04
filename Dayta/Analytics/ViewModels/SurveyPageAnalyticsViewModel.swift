//
//  SurveyPageAnalyticsViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 4/25/23.
//

import Foundation

struct SurveyPageAnalyticsViewModel: Identifiable {
    
    var id: String
    var pageLabel: String
    var attributes: [surveyAttribute]
    
    init(id: String, pageLabel: String, attributes: [surveyAttribute]) {
        self.id = id
        self.pageLabel = pageLabel
        self.attributes = attributes
    }
}


struct surveyAttribute: Identifiable {
    var id: String
    var prompt: String
    var sliderChartData: [sliderChartData]?
    //make variable for max value of slider
    var toggleChartData: [toggleChartData]?
    
    init(prompt: String, sliderChartData: [sliderChartData]? = nil, toggleChartData: [toggleChartData]? = nil) {
        self.id = UUID().uuidString
        self.prompt = prompt
        self.sliderChartData = sliderChartData
        self.toggleChartData = toggleChartData
    }
}

struct sliderChartData: Identifiable {
    var id: String
    var date: Date
    var value: Int
    
    init(date: Date, value: Int) {
        self.id = UUID().uuidString
        self.date = date
        self.value = value
    }
}

struct toggleChartData: Identifiable {
    var id: String
    var date: Date
    var value: Bool
    
    init(date: Date, value: Bool) {
        self.id = UUID().uuidString
        self.date = date
        self.value = value
    }
}
