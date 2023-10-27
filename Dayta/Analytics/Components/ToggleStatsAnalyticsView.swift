//
//  ToggleStatsAnalyticsView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 5/16/23.
//

import SwiftUI

struct ToggleStatsAnalyticsView: View {
    var data: ToggleData
    
    var body: some View {
        
        VStack{
            HStack(alignment: .top) {
                LabelledNumberBox(title: "Percentage of time completed", number: calculatePercentage())
                LabelledNumberBox(title: "Corelation to Day Score", number: calculateCorrelation())
            }
            HStack(alignment: .top) {
                let sumCompleted = Int(sumCompleted())
                //need to add goal to toggle vm
                LabelledNumberBox(title: "Goal completion", stat: "\(sumCompleted)/\(data.chartData.count)")
            }
        }
    }
    
    
    func calculatePercentage() -> Double {
        //calculate the average of the slider data
        let total = sumCompleted()

        return  round((total / Double(data.chartData.count))*100)/100
    }
    
    func sumCompleted() -> Double {
        var sum: Double = 0
        
        for i in data.chartData {
            if(i.value){
                sum += 1
            }
        }
        
        return sum
    }
    
    func calculateCorrelation() -> Double {
        //calculate the correlation between the slider data and the day score
        var sumOfX = 0
        var sumOfY = 0
        var sumOfXY = 0
        var sumOfX2 = 0
        var sumOfY2 = 0

        for (_ , i) in data.chartData.enumerated() {
            let toggleValue = (i.value) ? 1 : 0
            
            sumOfX += toggleValue
            sumOfY += i.dayScore
            sumOfXY += toggleValue * i.dayScore
            sumOfX2 += toggleValue * toggleValue
            sumOfY2 += i.dayScore * i.dayScore
        }

        let numerator = Double(data.chartData.count * sumOfXY - sumOfX * sumOfY)
        let denominator = Double(sqrt(Double(data.chartData.count * sumOfX2 - sumOfX * sumOfX) * Double(data.chartData.count * sumOfY2 - sumOfY * sumOfY)))
        
        return round((numerator/denominator) * 100)/100
            
    }
}



struct ToggleStatsAnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleStatsAnalyticsView(data: toggleChartDataExample.toggleData!)
    }
}
