//
//  SurveyPage.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/28/23.


import SwiftUI

struct SurveyPage: View {
    @State var mainInput: Int = 4
    var model: SurveyPageViewModel
    
    var pageLabel: String = "On the whole, how was your day"
    
    @State var toggleInput: Bool = false
    
    var body: some View {
        VStack{
            Text(model.pageLabel)
            
            Section{
                if (model.mainPrompt is SliderViewModel){
                    SliderInput(model: model.mainPrompt as! SliderViewModel)
                }
                else{
                    LabeledToggle(model: model.mainPrompt as! LabeledToggleViewModel)
                }
            }
            
            if(!model.morePrompts.morePrompts.isEmpty) {
                Section{
                    ExpandableMoreSection(model: model.morePrompts)
                }
            }
        }

    }
}
