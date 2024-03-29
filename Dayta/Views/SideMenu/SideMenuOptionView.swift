//
//  SideMenuOptionView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/22/23.
//

import SwiftUI

struct SideMenuOptionView: View {
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .frame(width:24, height: 24)
            Text(viewModel.title)
                .font(.system(size: 15, weight: .semibold))
        }
        .padding()
        
        Spacer()
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(viewModel: .profile)
    }
}
