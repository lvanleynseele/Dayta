//
//  LabelledNumberBox.swift
//  Dayta
//
//  Created by Liam van Leynseele on 5/16/23.
//

import SwiftUI

//struct LabelledNumberBox: View {
//    var title: String
//    var number: Double
//
//    var body: some View {
//        VStack{
//            ZStack{
//                Rectangle()
//                    .frame(width: 60, height: 75)
//                    .cornerRadius(10)
//                    .foregroundColor(Color(UIColor.systemGray5))
//                Text(String(number))
//                    .foregroundColor(.black)
//                    .multilineTextAlignment(.center)
//            }
//            Text(title)
//                .font(.footnote)
//                .multilineTextAlignment(.center)
//                .frame(maxWidth: 100)
//        }.padding([.horizontal, .top], 10)
//    }
//}

struct LabelledNumberBox: View {
    var title: String
    var number: Double? = nil
    var stat: String? = nil


    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .frame(width: 60, height: 75)
                    .cornerRadius(10)
                    .foregroundColor(Color(UIColor.systemGray5))
                if(number != nil){
                    Text(String(number!))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
                else{
                    if(stat != nil){
                        Text(stat!)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            Text(title)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 100)
        }.padding([.horizontal, .top], 10)
    }
}

struct LabelledNumberBox_Previews: PreviewProvider {
    static var previews: some View {
        LabelledNumberBox(title: "Average", number: 4.5)
    }
}
