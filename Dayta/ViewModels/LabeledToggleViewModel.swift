//
//  LabeledToggleViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/31/23.
//

import Foundation

class LabeledToggleViewModel: ObservableObject {
    var id: String = UUID().uuidString
    var label: String = ""
    @Published var State: Bool = false
}
