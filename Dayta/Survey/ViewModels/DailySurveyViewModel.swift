//
//  DailySurveyViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 4/18/23.
//

import Foundation
import SwiftUI

class DailySurveyViewModel: Identifiable, Codable {
    var date: Date
    var survey: [SurveyPageViewModel]
    var dayScore: Int
    
    init(survey: [SurveyPageViewModel]){
        self.date =  Date()
        self.survey = survey
        self.dayScore = survey.first?.mainSlider?.inputState ?? -1
    }
    
    private enum codingKeys: CodingKey {
        case date
        case survey
        case dayScore
    }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: codingKeys.self)
        date = try values.decode(Date.self, forKey: .date)
        dayScore = try values.decode(Int.self, forKey: .dayScore)
        survey = try values.decode([SurveyPageViewModel].self, forKey: .survey)
    }
        
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: codingKeys.self)
        try container.encode(date, forKey: .date)
        try container.encode(survey, forKey: .survey)
        try container.encode(dayScore, forKey: .dayScore)
    }
}
