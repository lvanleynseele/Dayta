//
//  SurveyPage.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/28/23.


import SwiftUI

struct SurveyPage: View {
    var model: SurveyPageViewModel
    
    var body: some View {
        VStack{
            Text(model.pageLabel)
                .foregroundColor(Color.blue)
                .font(.title2)
            
            Section {
                if (model.mainSlider != nil){
                    SliderInput(model: model.mainSlider!)
                }
                else{
                    LabeledToggle(model: model.mainToggle!)
                }
            }
            
            if(model.morePrompts != nil) {
                Section {
                    ExpandableMoreSection(model: model.morePrompts!)
                }
            }
        }

    }
}
