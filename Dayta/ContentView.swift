//
//  ContentView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/22/23.
//
import Foundation
import SwiftUI

struct ContentView: View {
    @State private var isSideMenuShowing = false
    @State public var user: UserViewModel = UserViewModel.Liam //UserViewModel.empty
    
    var body: some View {
        if !user.isLoggedIn {
            LoginView(user: $user)
        }
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]),
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                if isSideMenuShowing {
                    SideMenuView(isSideMenuShowing: $isSideMenuShowing)
                }
                ZStack {
                    Color(.white)
                    NavigationLink(destination: DailySurveyView()){
                        Text("Take your daily survey")
                    }.buttonStyle(BlueButton())
                }
                    .cornerRadius(isSideMenuShowing ? 20 : 10)
                    .offset(x: isSideMenuShowing ? 200: 0, y: isSideMenuShowing ? 50: 0)
                    .scaleEffect(isSideMenuShowing ? 0.75 : 1)
                    .navigationBarItems(
                        leading: Button(
                            action: {
                                withAnimation(.spring()){
                                    isSideMenuShowing.toggle()
                                }
                            },
                            label: {Image(systemName: "list.bullet")
                                    .foregroundColor(.black)
                            }
                        ))
                    .navigationBarTitle("Home", displayMode: .inline)
            }
            .onAppear {
                isSideMenuShowing = false
            }
        }
    }                                                  
}
