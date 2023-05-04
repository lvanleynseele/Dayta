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
    var surveyData: [DailySurveyViewModel]
    
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
                    NavigationLink(destination: AnalyticsView(pages: getAnalyticsPages(surveys: surveyData).map{ model in
                        SurveyPageAnalysisView(model: model)
                        
                    }),
                        label: { SideMenuOptionView(viewModel: SideMenuViewModel.analytics) })
                .foregroundColor(.white)
                
                NavigationLink(destination: EditSurveyView(),
                               label: { SideMenuOptionView(viewModel: SideMenuViewModel.editSurvey) })
                .foregroundColor(.white)
                
                NavigationLink(destination: HelpView(),
                               label: { SideMenuOptionView(viewModel: SideMenuViewModel.helpPage) })
                .foregroundColor(.white)
                
//                ForEach(SideMenuViewModel.allCases, id: \.self) { option in
//                    NavigationLink(destination: option.view ,
//                                   label:{ SideMenuOptionView(viewModel: option)}
//                    )
//                    .foregroundColor(.white)
//
//                }
                
                Spacer()
            }
        }.navigationBarHidden(true)
        
        let temp = getAnalyticsPages(surveys: surveyData)
    }
    
    
    
    func getAnalyticsPages(surveys: [DailySurveyViewModel]) -> [SurveyPageAnalyticsViewModel]{
        
        var pageViewModels: [String : SurveyPageAnalyticsViewModel] = [:]
        
        //just cover main input for now
        for i in 0..<surveyData.count {
            let survey = surveyData[i]
            
            let currentDate = survey.date
            
            for j in 0..<survey.survey.count {
                let page = survey.survey[j]
                if(pageViewModels.keys.contains(page.pageLabel)){
                    pageViewModels[page.pageLabel]!.attributes = makeChartData(page: page, date: currentDate, viewModels: pageViewModels)
                }
                else {
                    pageViewModels[page.pageLabel] = makeSurveyPageAnalyticsViewModel(page: page, date: currentDate)
                }
                
            }
        }
        
        
        return Array(pageViewModels.values)
    }
    
    
    func makeSurveyPageAnalyticsViewModel(page: SurveyPageViewModel, date: Date) -> SurveyPageAnalyticsViewModel {
        
        var attribute: surveyAttribute = surveyAttribute(prompt: page.pageLabel)
        
        if(page.mainSlider != nil){
            attribute.sliderChartData = [sliderChartData(date: date, value: page.mainSlider!.inputState)]
        }
        
        if(page.mainToggle != nil){
            attribute.toggleChartData = [toggleChartData(date: date, value: page.mainToggle!.inputState)]
        }
        
        return SurveyPageAnalyticsViewModel(id: page.id, pageLabel: page.pageLabel, attributes: [attribute])
        
    }
    
    func makeChartData (page: SurveyPageViewModel, date: Date, viewModels: [String: SurveyPageAnalyticsViewModel]) -> [surveyAttribute] {
        let currentPageModel = viewModels[page.pageLabel]
        //will need to do lookup on attribute when doing more than main prompt
        var mainAttribute = currentPageModel?.attributes[0]
        
        if(page.mainSlider != nil){
            mainAttribute?.sliderChartData?.append(sliderChartData(date: date, value: page.mainSlider!.inputState))
        }
        
        if(page.mainToggle != nil){
            mainAttribute?.toggleChartData?.append(toggleChartData(date: date, value: page.mainToggle!.inputState))
        }
        
        return [mainAttribute!]
    }
    
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isSideMenuShowing: .constant(true), profile: .constant(UserViewModel.Liam), surveyData: [])
    }
}
