//
//  DayScoreAnalyticsView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 4/25/23.
//

import SwiftUI
import Charts

struct DayScoreAnalyticsView: View {
    var surveyData: [DailySurveyViewModel]
    
    var body: some View {
        Chart {
            ForEach(surveyData) { survey in
                LineMark(x: .value("Date", formatDateShort(date: survey.date)),
                         y: .value("Score", survey.survey[0].mainSlider!.inputState)
                )
            }
        }
        .frame(width: 300, height: 300)
    }
}

struct DayScoreAnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        DayScoreAnalyticsView(surveyData: surveyDataExample)
    }
}
