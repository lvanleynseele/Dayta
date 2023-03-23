//
//  SideMenuHeaderView.swift
//  Dayta
//
//  Created by Liam van Leynseele on 3/22/23.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var isSideMenuShowing: Bool
    
    var body: some View {
        ZStack (alignment: .topTrailing) {
            Button(
                action: {
                    withAnimation(.spring()){
                        isSideMenuShowing.toggle()
                    }
                },
                label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                }
            )
            
            LoggedInUser()
        }
        
        //need to get app context for user status
    }
}


struct LoggedInUser: View {
    var body: some View {
        
        //wrap this in nav link to profile page
        VStack (alignment: .leading){
            //This is for header of side menu, should be either user iniitals or photo if account exists, otherwise prompt to make profile
            NoPhotoIcon()
            
            Text("Liam van Leynseele")
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.white)
            
            Spacer()
        }.padding()
    }
}

//show profile pic if exists
struct PhotoIcon: View {
    var body: some View {
        Image("")
            .resizable()
            .scaledToFill()
            .clipped()
            .frame(width: 64, height: 64)
            .clipShape(Circle())
            .padding(.bottom, 16)
    }
}

//if user has no profile pic, use initials
struct NoPhotoIcon: View {
    var body: some View {
        Text("LV")
            .font(.largeTitle)
            .foregroundColor(.white)
            .scaledToFill()
            .clipped()
            .frame(width: 64, height: 64)
            .clipShape(Circle())
//            .padding(2)
            .background(.green)
            .clipShape(Circle())
    }
}

//struct NotLoggedInUser: View {
//    var body: some View {
//        //add a nav link to create profile
//    }
//}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(isSideMenuShowing: .constant(true))
    }
}
