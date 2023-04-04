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


    var body: some View {
        Text(pageLabel)
            .foregroundColor(Color.blue)
            .font(.title2)
        
        Section {
            LabeledToggle(
                model: LabeledToggleViewModel(label: "Gym", prompt: "Did I go to the gym today?"))
        }
        
     
        Section {
            ExpandableMoreSection(model: ExpandableMoreSectionViewModel(id: UUID().uuidString, morePrompts: [
                LabeledToggleViewModel(label: "Leg Workout", prompt: "Did I do leg day?"),
                LabeledToggleViewModel(label: "Arm Workout", prompt: "Did I do arm day?")
            ]))
        }
    }
}

struct GymView_Previews: PreviewProvider {
    static var previews: some View {
        GymView()
    }
}
