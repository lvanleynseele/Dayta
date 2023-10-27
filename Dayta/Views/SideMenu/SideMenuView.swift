//
//  SideMenuView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/22/23.
//

import SwiftUI
import Foundation

struct SideMenuView: View {
    @Binding var isSideMenuShowing: Bool
    @Binding var profile: UserViewModel
    var surveyData: [SurveyPageAnalyticsViewModel]
    var surveyPages: [SurveyPageViewModel]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]),
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack{
                SideMenuHeaderView(isSideMenuShowing: $isSideMenuShowing, profile: $profile)
                    .frame(height: 240)
                
                NavigationLink(destination: ProfileView(),
                               label: { SideMenuOptionView(viewModel: SideMenuViewModel.profile) })
                .foregroundColor(.white)
                
                NavigationLink(destination: AnalyticsView(pages: surveyData.map{ model in
                        SurveyPageAnalysisView(model: model)
                    }),
                        label: { SideMenuOptionView(viewModel: SideMenuViewModel.analytics) })
                .foregroundColor(.white)
                
                NavigationLink(destination: MainEditView(pages: surveyPages.map{ model in
                        EditSurveyPageView(model: model)
                    } ),
                               label: { SideMenuOptionView(viewModel: SideMenuViewModel.editSurvey) })
                .foregroundColor(.white)
                
                NavigationLink(destination: HelpView(),
                               label: { SideMenuOptionView(viewModel: SideMenuViewModel.helpPage) })
                .foregroundColor(.white)
                Spacer()
            }
        }.navigationBarHidden(true)
    }
    
    
    
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isSideMenuShowing: .constant(true), profile: .constant(UserViewModel.Liam), surveyData: [], surveyPages: [])
    }
}






//converts daily survey vm to deprecated survey analystics vm
/*
 func getAnalyticsPages(surveys: [DailySurveyViewModel]) -> [SurveyPageAnalyticsViewModel]{

     var pageViewModels: [String : SurveyPageAnalyticsViewModel] = [:]

     //just cover main input for now
     for i in 0..<surveyData.count {
         let survey = surveyData[i]

         let currentDate = survey.date
         let dayScore = survey.dayScore

         for j in 0..<survey.survey.count {
             let page = survey.survey[j]
             if(pageViewModels.keys.contains(page.pageLabel)){
                 pageViewModels[page.pageLabel]!.attributes = makeChartData(page: page, date: currentDate, dayScore: dayScore, viewModels: pageViewModels)
             }
             else {
                 pageViewModels[page.pageLabel] = makeSurveyPageAnalyticsViewModel(page: page, date: currentDate, dayScore: dayScore)
             }

         }
     }

     let encoder = JSONEncoder()
     encoder.outputFormatting = .prettyPrinted

     do {
         let values: [SurveyPageAnalyticsViewModel] = Array(pageViewModels.values)

         let encoded = try encoder.encode(values)

         print(encoded)
     }
     catch {
         print("Could not write to file: \(error)")
     }


     return Array(pageViewModels.values)
 }


 func makeSurveyPageAnalyticsViewModel(page: SurveyPageViewModel, date: Date, dayScore: Int) -> SurveyPageAnalyticsViewModel {

     var attribute: SurveyAttribute = SurveyAttribute(prompt: page.pageLabel)

     if(page.mainSlider != nil){
         attribute.sliderData?.chartData = [SliderChartData(date: date, value: page.mainSlider!.inputState, dayScore: dayScore)]
     }

     if(page.mainToggle != nil){
         attribute.toggleData?.chartData = [ToggleChartData(date: date, value: page.mainToggle!.inputState, dayScore: dayScore)]
     }

     return SurveyPageAnalyticsViewModel(id: page.id, pageLabel: page.pageLabel, attributes: [attribute])

 }

 func makeChartData (page: SurveyPageViewModel, date: Date, dayScore: Int, viewModels: [String: SurveyPageAnalyticsViewModel]) -> [SurveyAttribute] {
     let currentPageModel = viewModels[page.pageLabel]
     //will need to do lookup on attribute when doing more than main prompt
     let mainAttribute = currentPageModel?.attributes[0]

     if(page.mainSlider != nil){
         mainAttribute?.sliderData!.chartData.append(SliderChartData(date: date, value: page.mainSlider!.inputState, dayScore: dayScore))
     }

     if(page.mainToggle != nil){
         mainAttribute?.toggleData!.chartData.append(ToggleChartData(date: date, value: page.mainToggle!.inputState, dayScore: dayScore))
     }

     return [mainAttribute!]
 }

 ```

 
 */

