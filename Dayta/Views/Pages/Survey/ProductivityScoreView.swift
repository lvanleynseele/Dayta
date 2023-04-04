//
//  ProductivityScoreView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/29/23.
//

import SwiftUI

struct ProductivityScoreView: View {
    
    var pageLabel: String = "How productive was I today?"
    
    @State var toggleInput: Bool = false
    
    
    var body: some View {
        Text(pageLabel)
            .foregroundColor(Color.blue)
            .font(.title2)
        
        Section{
            SliderInput(model: SliderViewModel(label: "Productivity", prompt: "Rate your productivity:", maximumRating: 5))
        }
        
        Section{
            ExpandableMoreSection(model: ExpandableMoreSectionViewModel(id: UUID().uuidString, morePrompts: [LabeledToggleViewModel(label: "Commit Code", prompt: "Did I commit code today?")]))
        }
    }
}

struct ProductivityScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ProductivityScoreView()
    }
}
