//
//  SurveyPage.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/28/23.


import SwiftUI

struct SurveyPage: View {
    var model: SurveyPageViewModel
    
    var body: some View {
        
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
            }//.frame(width: 200, height: 200, alignment: .top)
//                .border(.black)
//                .cornerRadius(20)
//
            if(model.morePrompts != nil) {
                Section {
                    ExpandableMoreSection(model: model.morePrompts!)
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}
