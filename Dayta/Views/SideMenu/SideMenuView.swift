//
//  SideMenuView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/22/23.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isSideMenuShowing: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]),
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack{
                SideMenuHeaderView(isSideMenuShowing: $isSideMenuShowing)
                    .frame(height: 240)
                
                ForEach(SideMenuViewModel.allCases, id: \.self) { option in
                    NavigationLink(destination: option.view ,
                                   label:{ SideMenuOptionView(viewModel: option)}
                    )
                    .foregroundColor(.white)
                    
                }
                
                Spacer()
            }
        }.navigationBarHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isSideMenuShowing: .constant(true))
    }
}
