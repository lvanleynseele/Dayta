//
//  ProfileViewModel.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/23/23.
//

import Foundation
import SwiftUI


struct UserViewModel {
    var id: String //uuid string
    var userName: String
    var firstName: String
    var lastName: String
//    var homeTown: NSTextLocation // use to track behavior when traveling?
    //var birthDate: Date
    //var notificationTime: Time
    var createdDate: Date
    var isLoggedIn: Bool
    var loginDate: Date
    
}

//https://auth0.com/blog/get-started-ios-authentication-swift-swiftui-part-1-login-logout/

extension UserViewModel {
    static var empty: Self {
        return UserViewModel (
            id: "",
            userName: "",
            firstName: "",
            lastName: "",
            createdDate: Date.now,
            isLoggedIn: false,
            loginDate: Date.now
        )
    }
}

extension UserViewModel {
    static var Liam: Self {
        return UserViewModel (
            id: "9fe77ca9-43a7-4591-91f7-c494728f4eb8",
            userName: "lvanleynseele",
            firstName: "Liam",
            lastName: "van Leynseele",
            createdDate: ISO8601DateFormatter().date(from:"2023-03-24 12:24:26") ?? Date.now,
            isLoggedIn: true,
            loginDate: Date.now
        )
    }
}
