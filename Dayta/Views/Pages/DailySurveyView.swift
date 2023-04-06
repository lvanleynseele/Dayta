//
//  DailySurveyView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/22/23.
//

import SwiftUI

struct DailySurveyView<Page: View>: View {
    var pages: [Page]
    
    
    @State var isShowingSheet = false
    @State var currentPage: Int = 0
    
    @State var index = 0
    let numPages = SurveyPageState.allCases.count
    
    var body: some View {
        
        
        
        VStack(alignment: .leading){
            //buttons for next prev
            DailySurveyViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}
    

struct SurveyContent<Content:View>: View {
    
    var content: Content
    
    init(@ViewBuilder content: () -> Content){
        self.content = content()
    }
    
    var body: some View {
        content
    }
    
}
