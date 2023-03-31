//
//  SurveyPage.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/28/23.
//

import SwiftUI

struct SurveyPage: View {
    @State var mainInput: Int = 4
    var label: String = "Rate your day:"
    
    var pageLabel: String = "On the whole, how was your day"
    
    @State var toggleInput: Bool = false
    
    var body: some View {
        VStack{
            Text(pageLabel)
            
            Section{
                SliderInput(input: $mainInput, label: label)
            }
            
            
            //will remove this at some point
            let toggle = LabeledToggle(label: "Temp toggle label", input: $toggleInput)
            
            let morePrompts = [toggle]
            
            
            if(!morePrompts.isEmpty) {
                Section{
                    ExpandableMoreSection(prompts: morePrompts)
                }
            }
        }

    }
}

struct SurveyPage_Previews: PreviewProvider {
    static var previews: some View {
        SurveyPage()
    }
}
