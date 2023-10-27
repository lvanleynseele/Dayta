//
//  SurveyPage.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/28/23.


import SwiftUI

struct SurveyPage: View {
    var model: SurveyPageViewModel
    
    var body: some View {
        
        GeometryReader { geometry in
            Section {
                Text(model.pageLabel)
                    .foregroundColor(Color.blue)
                    .font(.title2)
                    .padding()
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            
            VStack{
                Section {
                    if (model.mainSlider != nil){
                        SliderInput(model: model.mainSlider!)
                    }
                    else{
                        if (model.mainToggle != nil){
                            LabeledToggle(model: model.mainToggle!)
                        }
                    }
                }
                .position(x: geometry.size.width/2, y: geometry.size.height/4)
                
                if(model.morePrompts != nil) {
                    Section {
                        ExpandableMoreSection(model: model.morePrompts!)
                    }.frame(maxWidth: 300)
                    .position(x: geometry.size.width/2, y: geometry.size.height/5)
                }
            }
        
            
        }
    }
}


struct SurveyPage_Previews: PreviewProvider {
    static var previews: some View {
        SurveyPage(model: surveyPageExampleSlider)
    }
}
