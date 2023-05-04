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
        VStack {
            Section {
                Text(pageLabel)
                    .foregroundColor(Color.blue)
                    .font(.title2)
            }
            
            Section {
                LabeledToggle(
                    model: LabeledToggleViewModel(id: UUID().uuidString, label: "Gym", prompt: "Did I go to the gym today?"))
            }
            
         
            Section {
                ExpandableMoreSection(model: ExpandableMoreSectionViewModel(id: UUID().uuidString, morePrompts: [
                    LabeledToggleViewModel(id: UUID().uuidString, label: "Leg Workout", prompt: "Did I do leg day?"),
                    LabeledToggleViewModel(id: UUID().uuidString, label: "Arm Workout", prompt: "Did I do arm day?")
                ]))
            }
        }
        
    }
}

struct GymView_Previews: PreviewProvider {
    static var previews: some View {
        GymView()
    }
}
