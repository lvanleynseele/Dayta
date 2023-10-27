//
//  DailySurveyView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/22/23.
//

import SwiftUI

struct DailySurveyView<Page: View>: View {
    var pages: [Page]
    
    @State var currentPage: Int = 0
    @State var showSubmitAlert: Bool = false
    @State var surveySubmitted: Bool = false
    
    var dailySurveys: [DailySurveyViewModel]
    var surveyData: [SurveyPageAnalyticsViewModel]
//
//    let navController = UINavigationController(nibName: "ContentView", bundle: nil)
    
    var body: some View {
        let pageCount = pages.count
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]),
                               startPoint: .top,
                               endPoint: .bottom)
                VStack(alignment: .leading){
                    HStack{
    //                    LastPageButton(numberOfPages: pages.count, currentPage: $currentPage)
                        Button("< Previous", action: {
                            if(currentPage > 0){
                                currentPage -= 1
                            }
                        })
                        Spacer()
                        Button("Next >", action: {
                            if(currentPage < pageCount - 1){
                                currentPage += 1
                            }
                        })
                    }
                    .padding([.horizontal, .top], 10)
                        .foregroundColor(.white)
                    PageViewController(pages: pages, currentPage: $currentPage)
                    PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                        .frame(alignment: .center)
                        .padding(.bottom, 10)
                }
            }
            .cornerRadius(20)
            .scaleEffect(0.99)
            .toolbar {
                SubmitControl(pages: pages as! [SurveyPage], dailySurveys: dailySurveys, surveyData: surveyData, showSubmitAlert: $showSubmitAlert, surveySubmitted: $surveySubmitted)
                .alert(isPresented: $showSubmitAlert){
                    Alert(title: Text("All main prompts must be answered"))
                }
                
            }
            .navigationBarTitle("Daily Survey", displayMode: .inline)

             NavigationLink(destination: ContentView(), isActive: $surveySubmitted) {
                 EmptyView()
             }
    }
}

//struct DailySurveyView_Previews: PreviewProvider {
//    static var previews: some View {
//        DailySurveyView(pages: [GymView()],  )
//    }
//}

