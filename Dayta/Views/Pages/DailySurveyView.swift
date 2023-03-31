//
//  DailySurveyView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/22/23.
//

import SwiftUI

struct DailySurveyView: View {
    //@State var morePrompts: [LabeledToggle]
    @State var isShowingSheet = false
    
    @State var currentPage: any View = DayScoreView()
    
    @State var index = 0
    let numPages = SurveyPageState.allCases.count
    
    
    
    var body: some View {
    
        VStack(alignment: .leading){
            //buttons for next prev
            HStack {
                Button("< Previous") {
                    if(index > 0){
                        index -= 1
                    }                }
                .background(index>0 ? .blue : .gray)
                .foregroundColor(index>0 ? .white : .black)
                .clipShape(Capsule())
                
                Spacer()
                
                Button("Next >") {
                    if(index<numPages-1){
                        index += 1
                    }
                }
                .background(index<numPages-1 ? .blue : .gray)
                .foregroundColor(index<numPages-1 ? .white : .black)
                .clipShape(Capsule())
                
            }.buttonStyle(.borderedProminent)
                .padding(.horizontal)
                .frame(alignment: .top)
        
            
        }
    
        Spacer()
        
        VStack(alignment: .center){
            getPage
                .frame(alignment: .center)
        }
    }
    
    
    @ViewBuilder private var getPage: some View {

        switch index{
            case 0:
                DayScoreView()
            case 1:
                ProductivityScoreView()
            case 2:
                GymView()
            case 3:
                SubmitView()
            default:
                EmptyView()
                
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
