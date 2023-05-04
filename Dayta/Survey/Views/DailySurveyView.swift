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
    @State var finishSurveyAlert: Bool = false
    @State var submitted: Bool = false
    
    var body: some View {
        let pageCount = pages.count
        
        
        VStack(alignment: .leading){
            HStack{
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
            }.padding([.horizontal, .top], 10)
            
            //buttons for next prev
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(alignment: .center)
            
        }.background(Color(.green))
            .toolbar {
                
                
                SubmitControl(pages: pages as! [SurveyPage], submitted: $submitted, showSubmitAlert: $finishSurveyAlert)
                    .alert(isPresented: $finishSurveyAlert){
                        Alert(title: Text("All main prompts must be answered"))
                    }
        }
            .navigationBarTitle("Daily Survey", displayMode: .inline)
            .cornerRadius(20)
            .scaleEffect(0.99)
    }
}

struct DailySurveyView_Previews: PreviewProvider {
    static var previews: some View {
        DailySurveyView(pages: [GymView()] )
    }
}

