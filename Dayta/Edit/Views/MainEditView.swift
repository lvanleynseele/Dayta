//
//  MainEditView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 5/19/23.
//

import SwiftUI

struct MainEditView<Page: View>: View {
    
    var pages: [Page]
    @State var currentPage: Int = 0
    
    var body: some View {
        let pageCount = pages.count
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]),
                           startPoint: .top,
                           endPoint: .bottom)
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
        .navigationBarTitle("Edit Survey", displayMode: .inline)
    }
}
