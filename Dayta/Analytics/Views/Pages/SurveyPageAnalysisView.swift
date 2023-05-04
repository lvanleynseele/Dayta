//
//  SurveyPageAnalysisView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 4/25/23.
//

import SwiftUI
import Charts

struct SurveyPageAnalysisView: View {
    var model: SurveyPageAnalyticsViewModel
    
    var body: some View {
        Section {
            Text(model.pageLabel)
                .foregroundColor(Color.blue)
                .font(.title2)
                .padding()
        }.frame(alignment: .top)
        
        
        ForEach(model.attributes){ attribute in
            if(attribute.sliderChartData != nil){
                SliderChartView(data: attribute)
                    
            }
            else{
                if(attribute.toggleChartData != nil) {
                    ToggleChartView(data: attribute)
                }
            }
        }.frame(width: 300, height: 300)
    }
}


struct SliderChartView: View {
    var data: surveyAttribute
    
    var body: some View {
        Section {
            Chart {
                ForEach(data.sliderChartData!) { survey in
                    LineMark(x: .value("Date", formatDateShort(date: survey.date)),
                             y: .value("Score", survey.value)
                    )
                }
            }
//            .chartXAxis {
//                //count should be made into variable to display different time ranges
//                AxisMarks(values: .stride(by: .day, count: 7)) { _ in
//                    AxisValueLabel(format: .dateTime.day(.twoDigits))
//                }
//            }
            .chartYAxis{
                AxisMarks(values: .stride(by: 1))
            }
            .chartYScale(domain: [0,7])
        }
    }
}

struct ToggleChartView: View {
    var data: surveyAttribute
    
    var body: some View {
        Section {
            Chart {
                ForEach(data.toggleChartData!) { survey in
                    BarMark(x: .value("Date", formatDateShort(date: survey.date)),
                            y: .value("Score", survey.value == true ? 1 : -1)
                    )
                }
            }.chartXAxis {
                //count should be made into variable to display different time ranges
                AxisMarks(values: .stride(by: .day, count: 7)) { _ in
                    AxisValueLabel(format: .dateTime.day(.twoDigits))
                }
            }
            .chartYAxis{
                AxisMarks(values: .stride(by: 1))
            }
            .chartYScale(domain: [-1,1])
        }
    }
    
}






//struct SurveyPageAnalysisView_Previews: PreviewProvider {
//    static var previews: some View {
//        SurveyPageAnalysisView(surveyData: surveyDataExample)
//    }
//}
