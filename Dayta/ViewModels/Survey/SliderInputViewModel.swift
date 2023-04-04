//
//  SliderInputViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/31/23.
//

import Foundation
import SwiftUI


class SliderViewModel: ObservableObject {
    var id: String
    var label: String
    var prompt: String
    var maximumRating: Int
    
    let offImage: Image? = nil
    let onImage = Image(systemName: "circle.fill")

    let offColor = Color.gray
    let onColor = Color.green
    
    @Published var inputState: Int
    
    init(label: String, prompt: String, maximumRating: Int) {
        self.id = UUID().uuidString
        self.label = label
        self.prompt = prompt
        self.maximumRating = maximumRating
        self.inputState = maximumRating/2+1
    }
}
