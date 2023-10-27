//
//  CorrelationAnalyticsView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 5/15/23.
//

import SwiftUI

struct SliderStatsAnalyticsView: View {
    
    var data: SliderData
    
    var body: some View {
        HStack(alignment: .top) {
            LabelledNumberBox(title: "Average", number: calculateAvergae())
            LabelledNumberBox(title: "Corelation to Day Score", number: calculateCorrelation())
        }
    }
    
    func calculateAvergae() -> Double {
        //calculate the average of the slider data
        var total = 0
        for i in data.chartData {
            total += i.value
        }

        return Double(total / data.chartData.count)
    }
    
    func calculateCorrelation() -> Double {
        //calculate the correlation between the slider data and the day score
        var sumOfX = 0
        var sumOfY = 0
        var sumOfXY = 0
        var sumOfX2 = 0
        var sumOfY2 = 0

        for (_ , i) in data.chartData.enumerated() {
            sumOfX += i.value
            sumOfY += i.dayScore
            sumOfXY += i.value * i.dayScore
            sumOfX2 += i.value * i.value
            sumOfY2 += i.dayScore * i.dayScore
        }

        let numerator = Double(data.chartData.count * sumOfXY - sumOfX * sumOfY)
        let denominator = Double(sqrt(Double(data.chartData.count * sumOfX2 - sumOfX * sumOfX) * Double(data.chartData.count * sumOfY2 - sumOfY * sumOfY)))
        
        return round((numerator/denominator) * 100)/100
            
    }
}

struct CorrelationAnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            SliderStatsAnalyticsView(data: sliderChartDataExample.sliderData!)
        }
        
    }
}
