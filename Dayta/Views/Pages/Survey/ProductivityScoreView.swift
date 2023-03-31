//
//  ProductivityScoreView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/29/23.
//

import SwiftUI

struct ProductivityScoreView: View {
    
    @State var mainInput: Int = 4
    var label: String = "Rate your productivity:"
    
    var pageLabel: String = "How productive was I today?"
    
    @State var toggleInput: Bool = false
    
    
    var body: some View {
        Text(pageLabel)
            .foregroundColor(Color.blue)
            .font(.title2)
        
        Section{
            SliderInput(input: $mainInput, label: label)
        }
        
        let toggle = LabeledToggle(label: "Did I commit code today?", input: $toggleInput)
        
        let morePrompts = [toggle]
        Section{
            ExpandableMoreSection(prompts: morePrompts)
        }
    }
}

struct ProductivityScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ProductivityScoreView()
    }
}
