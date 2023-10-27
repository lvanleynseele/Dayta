//
//  AnalyticsView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/23/23.
//

import SwiftUI
import Charts

struct AnalyticsView<Page: View>: View {
    var pages: [Page]
    @State var currentPage: Int = 0
    
    
    var body: some View {
        VStack{
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(alignment: .center)
            
            
        }.navigationBarTitle("Analytics", displayMode: .inline)
            .cornerRadius(20)
            .scaleEffect(0.99)
    }
}

//struct AnalyticsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnalyticsView(pages: [DayScoreAnalyticsView(surveyData: surveyDataExample)])
//    }
//}
