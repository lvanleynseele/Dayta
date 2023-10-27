//
//  SliderChartView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 5/15/23.
//

import SwiftUI
import Charts

struct SliderChartView: View {
    var data: SliderData
    
    let dateFormatter = DateFormatter().dateFormat
    
    var body: some View {
        Section {
            
            Chart (data.chartData, id: \.id)
            {
                PointMark(x: .value("Date", $0.date, unit: .day),
                          y: .value("Score", $0.value)
                )
                .foregroundStyle(Color(getSliderColor(value: $0.value, maxInput: data.maxValue)))
                
                LineMark(x: .value("Date", $0.date, unit: .day),
                         y: .value("Score", $0.value))
                .interpolationMethod(.catmullRom)
                .lineStyle(StrokeStyle(lineWidth: 1, dash: [3, 6]))
                .foregroundStyle(Color(.black))
            }
            .chartXAxis{
                AxisMarks(values: .stride(by: .day)){
                    AxisGridLine(centered: true)
                    AxisTick()
                    AxisValueLabel(format: .dateTime.day(.twoDigits))
                }
            }
            .chartYAxis{
                AxisMarks(values: .stride(by: 1)){
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel()
                }
            }
            .chartYScale(domain: [0,data.maxValue])
//            .chartPlotStyle { chart in
//                chart.background(UIColor.systemGray5)
//            }
        }
        .frame(width: 325, height: 250)
        .padding(10)
    }
    
    func formatDate(date: Date) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"

        let formatted = dateFormatter.string(from: date)
        
        return dateFormatter.date(from: formatted)!
    }
}

struct SliderChartView_Previews: PreviewProvider {
    static var previews: some View {
        Section{
            SliderChartView(data: sliderChartDataExample.sliderData!)
        }
            
    }
}
