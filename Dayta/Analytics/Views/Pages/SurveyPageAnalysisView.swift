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
        //        ZStack{
        //            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]),
        //                           startPoint: .top,
        //                           endPoint: .bottom)
        //            .ignoresSafeArea()
        
        ScrollView {
            Section {
                Text(model.pageLabel)
                    .foregroundColor(Color.blue)
                    .font(.title2)
                    .padding()
            }.frame(maxWidth: 350, alignment: .top)
                .border(.black)
                
            ForEach(model.attributes){ attribute in
                Section{
                    Text(attribute.prompt)
                        .foregroundColor(Color.blue)
                        .font(.title2)
                        .padding()
                    
                    if(attribute.sliderData != nil){
                        SliderChartView(data: attribute.sliderData!)
                        SliderStatsAnalyticsView(data: attribute.sliderData!)
                    }
                    else{
                        if(attribute.toggleData != nil) {
                            ToggleChartView(data: attribute.toggleData!)
                            ToggleStatsAnalyticsView(data: attribute.toggleData!)
                        }
                    }
                    
                }
                Divider()
            }
        }
        .navigationTitle("Analytics")
    }
}

struct SurveyPageAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyPageAnalysisView(model: SurveyPageAnalyticsExample)
    }
}
