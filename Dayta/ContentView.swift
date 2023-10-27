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
    
    @EnvironmentObject var modelData: ModelData
    
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
                    SideMenuView(isSideMenuShowing: $isSideMenuShowing, profile: $modelData.profile, surveyData: modelData.surveyData, surveyPages: modelData.surveyPages)
                }
                ZStack {
                    Color(.white)
                    NavigationLink(destination: DailySurveyView(pages: modelData.surveyPages.map({ model in
                        SurveyPage(model: model)
                    }), dailySurveys: modelData.dailySurveys, surveyData: modelData.surveyData)){
                        if( Calendar.current.isDate(modelData.dailySurveys.last!.date, inSameDayAs: Date.now) == true){
                            Text("Re-take your Daily Survey")
                        }
                        else{
                            Text("Take your Daily Survey")
                        }
                        
                        
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
