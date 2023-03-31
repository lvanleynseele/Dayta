//
//  GymView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/29/23.
//

import SwiftUI

struct GymView: View {
    
    @State var mainInput: Bool = false
    var label: String = "Rate your productivity:"
    
    var pageLabel: String = "How productive was I today?"
    
    @State var legDayToggleInput: Bool = false
    @State var armDayToggleInput: Bool = false
    
    
    var body: some View {
        Text(pageLabel)
            .foregroundColor(Color.blue)
            .font(.title2)
        
        Section {
            LabeledToggle(label: "Did I go to the gym today?", input: $mainInput)
        }
        
        let legDayToggle = LabeledToggle(label: "Did I commit code today?", input: $legDayToggleInput)
        let armDayToggle = LabeledToggle(label: "Did I commit code today?", input: $armDayToggleInput)
        
        let morePrompts = [legDayToggle,armDayToggle]
        Section {
            ExpandableMoreSection(prompts: morePrompts)
        }
    }
}

struct GymView_Previews: PreviewProvider {
    static var previews: some View {
        GymView()
    }
}
