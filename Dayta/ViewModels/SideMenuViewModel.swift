//
//  SideMenuViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/22/23.
//

import Foundation
import SwiftUI

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case analytics
    case editSurvey
    case helpPage
    
    var title: String {
        switch self {
        case .profile:
            return "Profile"
        case .analytics:
            return "Analytics"
        case .editSurvey:
            return "Edit Daily Survey"
        case .helpPage:
            return "Help"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile:
            return "person"
        case .analytics:
            return "chart.xyaxis.line"
        case .editSurvey:
            return "rectangle.and.pencil.and.ellipsis"
        case .helpPage:
            return "questionmark.circle"
        }
    }
    
//    var view: AnyView {
//        switch self {
//            case .profile:
//                return AnyView(ProfileView())
//            case .analytics:
//                return AnyView(AnalyticsView())
//            case .editSurvey:
//                return AnyView(EditSurveyView())
//            case .helpPage:
//                return AnyView(HelpView())
//        }
//    }
}
