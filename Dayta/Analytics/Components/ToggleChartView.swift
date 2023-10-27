//
//  ToggleChartView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 5/15/23.
//

import SwiftUI
import Charts

struct ToggleChartView: View {
    var data: ToggleData
    
    var body: some View {
        Section {
            Chart(data.chartData, id: \.id) {
                    BarMark(x: .value("Date", $0.date, unit: .day),
                            y: .value("", 1 )
                    )
                    .foregroundStyle($0.value == true ? Color(.green) : Color(.red))
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
                }
            }
            .chartYScale(domain: [0,1])
        }.frame(width: 325, height: 200)
        
    }
    
}
struct ToggleChartView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleChartView(data: toggleChartDataExample.toggleData!)
    }
}
