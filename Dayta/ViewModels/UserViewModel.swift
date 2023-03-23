//
//  ProfileViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/23/23.
//

import Foundation
import SwiftUI


struct UserViewModel {
    var userId: UUID
    var password: String //need to encrypt at some point
    var userName: String
    var firstName: String
    var lastName: String
    var birthDate: Date
    //var notificationTime: Time
    var createdDate: Date
    var isLoggedIn: Bool
    var loginDate: Date
    
}
